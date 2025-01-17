document.addEventListener('DOMContentLoaded', () => {
    const feedbackForm = document.getElementById('feedbackForm');
    const analyticsTable = document.getElementById('analyticsTable');
    const loginForm = document.getElementById('loginForm');
    const loginContainer = document.getElementById('loginContainer');
    const analyticsContainer = document.getElementById('analyticsContainer');
    const PASSWORD = 'dushi'; // Password for analytics

    // Handle feedback form submission
    feedbackForm?.addEventListener('submit', (e) => {
        e.preventDefault();

        // Check if the user already submitted feedback
        if (localStorage.getItem('feedbackSubmitted')) {
            alert('You have already submitted feedback!');
            return;
        }

        const formData = new FormData(feedbackForm);
        const feedback = Object.fromEntries(formData.entries());

        // Validate all fields are selected
        for (let key in feedback) {
            if (!feedback[key]) {
                alert('Please answer all questions before submitting.');
                return;
            }
        }

        // Save feedback to localStorage
        const feedbackList = JSON.parse(localStorage.getItem('feedbackList')) || [];
        feedbackList.push(feedback);
        localStorage.setItem('feedbackList', JSON.stringify(feedbackList));

        // Mark as submitted
        localStorage.setItem('feedbackSubmitted', true);

        alert('Feedback submitted successfully!');
        feedbackForm.reset();
    });

    // Handle login for analytics page
    loginForm?.addEventListener('submit', (e) => {
        e.preventDefault();
        const password = document.getElementById('password').value;

        if (password === PASSWORD) {
            loginContainer.style.display = 'none';
            analyticsContainer.style.display = 'block';
            loadAnalytics();
            localStorage.setItem('analyticsAccessGranted', true);
        } else {
            alert('Incorrect password!');
        }
    });

    // Load feedback data into analytics table and charts
    function loadAnalytics() {
        const feedbackList = JSON.parse(localStorage.getItem('feedbackList')) || [];
        const tbody = analyticsTable.querySelector('tbody');

        // Clear existing table rows
        tbody.innerHTML = '';

        // Populate table
        feedbackList.forEach((feedback, index) => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${index + 1}</td>
                <td>${feedback.impression}</td>
                <td>${feedback.readability}</td>
                <td>${feedback.frostedGlass}</td>
                <td>${feedback.capAndText}</td>
                <td>${feedback.purchaseDecision}</td>
            `;
            tbody.appendChild(row);
        });

        // Generate charts
        generateCharts(feedbackList);
    }

    // Generate charts using Chart.js
    function generateCharts(feedbackList) {
        const categories = {
            impression: {},
            readability: {},
            frostedGlass: {},
            capAndText: {},
            purchaseDecision: {}
        };

        // Initialize categories
        for (let key in categories) {
            categories[key] = {};
        }

        // Count responses
        feedbackList.forEach(feedback => {
            for (let key in categories) {
                const answer = feedback[key];
                categories[key][answer] = (categories[key][answer] || 0) + 1;
            }
        });

        // Define chart configurations
        const chartConfigs = [
            {
                ctx: document.getElementById('impressionChart').getContext('2d'),
                label: 'First Impression',
                data: categories.impression
            },
            {
                ctx: document.getElementById('readabilityChart').getContext('2d'),
                label: 'Readability',
                data: categories.readability
            },
            {
                ctx: document.getElementById('frostedGlassChart').getContext('2d'),
                label: 'Frosted Glass Appeal',
                data: categories.frostedGlass
            },
            {
                ctx: document.getElementById('capAndTextChart').getContext('2d'),
                label: 'Cap & Text Color',
                data: categories.capAndText
            },
            {
                ctx: document.getElementById('purchaseDecisionChart').getContext('2d'),
                label: 'Purchase Decision',
                data: categories.purchaseDecision
            }
        ];

        // Destroy existing charts if any
        if (window.charts) {
            window.charts.forEach(chart => chart.destroy());
        }
        window.charts = [];

        // Create new charts
        chartConfigs.forEach(config => {
            const labels = Object.keys(config.data);
            const data = Object.values(config.data);

            const chart = new Chart(config.ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: config.label,
                        data: data,
                        backgroundColor: 'rgba(0, 123, 255, 0.6)',
                        borderColor: 'rgba(0, 123, 255, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: false
                        },
                        title: {
                            display: true,
                            text: config.label
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            precision:0
                        }
                    }
                }
            });

            window.charts.push(chart);
        });
    }

    // Prevent duplicate rows on page refresh
    if (analyticsTable) {
        // Only load analytics if already logged in
        if (localStorage.getItem('analyticsAccessGranted')) {
            loginContainer.style.display = 'none';
            analyticsContainer.style.display = 'block';
            loadAnalytics();
        }
    }

    // Optional: Allow resetting feedback submissions (for testing purposes)
    // Uncomment the following block to add a reset button

    /*
    const resetButton = document.createElement('button');
    resetButton.textContent = 'Reset Feedback';
    resetButton.className = 'btn';
    resetButton.style.backgroundColor = '#dc3545';
    resetButton.style.marginTop = '1rem';
    document.body.appendChild(resetButton);

    resetButton.addEventListener('click', () => {
        if (confirm('Are you sure you want to reset all feedback?')) {
            localStorage.removeItem('feedbackList');
            localStorage.removeItem('feedbackSubmitted');
            localStorage.removeItem('analyticsAccessGranted');
            alert('All feedback has been reset.');
            location.reload();
        }
    });
    */
});
