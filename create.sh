#!/bin/bash

# Create project directory
PROJECT_DIR="tezeta-feedback"
mkdir -p $PROJECT_DIR/images

# Navigate to project directory
cd $PROJECT_DIR

# Create index.html
cat > index.html <<EOL
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TEZETA Feedback Form</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <img src="images/image.jpeg" alt="Survey Image" class="survey-image">
        <h1 class="text-center">TEZETA Perfume Bottle Feedback</h1>
        <p class="text-center">Share your thoughts on TEZETA's latest bottle design—your opinion matters to us!</p>
        <form id="feedbackForm">
            <div class="form-group">
                <label for="impression">1. What is your first impression of the bottle design?</label>
                <select name="impression" id="impression" required>
                    <option value="" disabled selected>Select an option</option>
                    <option value="Elegant">Elegant</option>
                    <option value="Minimalistic">Minimalistic</option>
                    <option value="Modern">Modern</option>
                    <option value="Unappealing">Unappealing</option>
                </select>
            </div>

            <div class="form-group">
                <label for="readability">2. How would you rate the readability of the text and logo on the bottle?</label>
                <select name="readability" id="readability" required>
                    <option value="" disabled selected>Select an option</option>
                    <option value="Very clear">Very clear</option>
                    <option value="Somewhat clear">Somewhat clear</option>
                    <option value="Hard to read">Hard to read</option>
                </select>
            </div>

            <div class="form-group">
                <label for="frostedGlass">3. Do you think the frosted glass adds to the bottle's appeal?</label>
                <select name="frostedGlass" id="frostedGlass" required>
                    <option value="" disabled selected>Select an option</option>
                    <option value="Yes, it feels premium">Yes, it feels premium</option>
                    <option value="Neutral, it’s okay">Neutral, it’s okay</option>
                    <option value="No, it doesn’t stand out">No, it doesn’t stand out</option>
                </select>
            </div>

            <div class="form-group">
                <label for="capAndText">4. Does the color of the cap and text complement the overall design?</label>
                <select name="capAndText" id="capAndText" required>
                    <option value="" disabled selected>Select an option</option>
                    <option value="Yes, perfectly">Yes, perfectly</option>
                    <option value="Somewhat, could be better">Somewhat, could be better</option>
                    <option value="No, it feels mismatched">No, it feels mismatched</option>
                </select>
            </div>

            <div class="form-group">
                <label for="purchaseDecision">5. Would this design influence your decision to purchase the perfume?</label>
                <select name="purchaseDecision" id="purchaseDecision" required>
                    <option value="" disabled selected>Select an option</option>
                    <option value="Yes, I’d buy it based on the design">Yes, I’d buy it based on the design</option>
                    <option value="Maybe, depends on the scent and price">Maybe, depends on the scent and price</option>
                    <option value="No, the design isn’t appealing enough">No, the design isn’t appealing enough</option>
                </select>
            </div>

            <button type="submit" class="btn">Submit Feedback</button>
        </form>
    </div>
    <script src="script.js"></script>
</body>
</html>
EOL

# Create analytics.html
cat > analytics.html <<EOL
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TEZETA Feedback Analytics</title>
    <link rel="stylesheet" href="styles.css">
    <!-- Chart.js CDN -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="container" id="loginContainer">
        <h1 class="text-center">TEZETA Feedback Analytics</h1>
        <form id="loginForm">
            <div class="form-group">
                <label for="password">Enter Password:</label>
                <input type="password" id="password" class="form-control" required placeholder="Enter password">
            </div>
            <button type="submit" class="btn">Login</button>
        </form>
    </div>

    <div class="container" id="analyticsContainer" style="display: none;">
        <h1 class="text-center">Feedback Responses</h1>
        <div class="charts">
            <canvas id="impressionChart"></canvas>
            <canvas id="readabilityChart"></canvas>
            <canvas id="frostedGlassChart"></canvas>
            <canvas id="capAndTextChart"></canvas>
            <canvas id="purchaseDecisionChart"></canvas>
        </div>
        <h2 class="text-center">Detailed Feedback</h2>
        <table id="analyticsTable">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Impression</th>
                    <th>Readability</th>
                    <th>Frosted Glass</th>
                    <th>Cap & Text</th>
                    <th>Purchase Decision</th>
                </tr>
            </thead>
            <tbody>
                <!-- Feedback rows will be dynamically added here -->
            </tbody>
        </table>
    </div>
    <script src="script.js"></script>
</body>
</html>
EOL

# Create styles.css
cat > styles.css <<EOL
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f8f9fa;
}

.container {
    max-width: 1000px;
    margin: 2rem auto;
    background: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 2rem;
}

h1 {
    font-size: 2rem;
    color: #333;
    text-align: center;
    margin-bottom: 1.5rem;
}

h2 {
    font-size: 1.5rem;
    color: #333;
    text-align: center;
    margin-top: 2rem;
    margin-bottom: 1rem;
}

.text-center {
    text-align: center;
}

.form-group {
    margin-bottom: 1rem;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 0.5rem;
}

select, input[type="password"], .btn {
    width: 100%;
    padding: 0.75rem;
    font-size: 1rem;
    margin-bottom: 1rem;
    border: 1px solid #ddd;
    border-radius: 4px;
}

input[type="password"] {
    box-sizing: border-box;
}

.btn {
    background-color: #007bff;
    color: white;
    cursor: pointer;
    border: none;
    transition: background-color 0.3s ease;
}

.btn:hover {
    background-color: #0056b3;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 2rem;
}

th, td {
    border: 1px solid #ddd;
    padding: 0.75rem;
    text-align: center;
}

th {
    background-color: #f2f2f2;
}

.survey-image {
    display: block;
    margin: 0 auto 1.5rem auto;
    max-width: 100%;
    height: auto;
    border-radius: 8px;
}

.charts {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    gap: 2rem;
    margin-top: 2rem;
}

.charts canvas {
    max-width: 45%;
    height: auto;
}

@media (max-width: 768px) {
    .charts canvas {
        max-width: 100%;
    }
}
EOL

# Create script.js
cat > script.js <<'EOL'
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
EOL

# Create images/image.jpeg
# Since we cannot include binary data in the script, we'll add instructions to download a placeholder image.

echo "Please add a placeholder image named 'image.jpeg' in the 'images' directory."

# Make setup.sh executable
chmod +x setup.sh

echo "Project setup script 'setup.sh' has been created."
echo "To set up the project, run './setup.sh' in your terminal."
