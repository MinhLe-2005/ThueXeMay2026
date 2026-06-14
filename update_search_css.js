const fs = require('fs');
const path = 'src/main/webapp/motorbikes.jsp';
let content = fs.readFileSync(path, 'utf8');

// Replace heading to search submit CSS
const oldCssMatch = content.match(/\.filter-heading \{[\s\S]*?\.filter-apply-button:hover \{[\s\S]*?\}/);
if (oldCssMatch) {
    const newCss = \.filter-heading {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 24px;
                margin-bottom: 28px;
            }

            .filter-eyebrow {
                display: block;
                margin-bottom: 5px;
                color: #b59349;
                font-size: 13px;
                font-weight: 800;
                letter-spacing: 1.5px;
                text-transform: uppercase;
            }

            .filter-heading h2 {
                margin: 0;
                color: #1a1816;
                font-family: 'Plus Jakarta Sans', sans-serif;
                font-size: 30px;
                font-weight: 800;
                letter-spacing: -0.5px;
            }

            .filter-heading p {
                max-width: 430px;
                margin: 0;
                color: #7a746d;
                font-size: 15px;
                line-height: 1.6;
                text-align: right;
            }

            .filter-search-form {
                display: flex;
                align-items: center;
                background: #ffffff;
                border: 1px solid rgba(181, 147, 73, 0.2) !important;
                border-radius: 100px;
                padding: 6px 6px 6px 0;
                box-shadow: 0 8px 24px rgba(0, 0, 0, 0.04);
                transition: all 0.3s ease;
                width: 100%;
                margin-bottom: 28px;
            }

            .filter-search-form:focus-within {
                box-shadow: 0 12px 32px rgba(181, 147, 73, 0.15);
                border-color: #b59349 !important;
                transform: translateY(-2px);
            }

            .filter-search-field {
                flex-grow: 1;
                position: relative;
                display: flex;
                align-items: center;
            }

            .filter-search-field .search-icon {
                position: absolute;
                left: 24px;
                color: #b59349;
                font-size: 20px;
                pointer-events: none;
            }

            .filter-search-field input {
                width: 100%;
                height: 56px;
                padding: 0 24px 0 56px;
                border: none !important;
                background: transparent;
                font-family: 'Plus Jakarta Sans', sans-serif;
                font-size: 16px;
                color: #1a1816;
                outline: none !important;
                box-shadow: none !important;
            }

            .filter-search-field input::placeholder {
                color: #9e9589;
            }

            .filter-search-submit,
            .filter-apply-button {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                gap: 9px;
                font-family: 'Plus Jakarta Sans', sans-serif;
                font-weight: 700;
                font-size: 15px;
                border: none;
                cursor: pointer;
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            }

            .filter-search-submit {
                height: 56px;
                min-width: 150px;
                padding: 0 32px;
                border-radius: 100px;
                box-shadow: 0 4px 14px rgba(181, 147, 73, 0.3);
                background: linear-gradient(135deg, #b59349 0%, #d4b572 100%);
                color: #ffffff;
                margin-left: auto;
            }

            .filter-search-submit:hover,
            .filter-apply-button:hover {
                background: linear-gradient(135deg, #9f7f3e 0%, #c1a25d 100%);
                color: #ffffff;
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(181, 147, 73, 0.4);
            }\;
    content = content.replace(oldCssMatch[0], newCss);
    console.log('Replaced main CSS successfully.');
} else {
    console.log('Could not match main CSS block.');
}

// Replace mobile CSS
const oldResponsiveMatch = content.match(/@media \\(max-width: 768px\\) \\{[\\s\\S]*?\\.filter-search-submit \\{[\\s\\S]*?\\}/);
if (oldResponsiveMatch) {
    const newResponsive = \@media (max-width: 768px) {
                .vehicle-filter-shell {
                    padding: 0 12px;
                }

                .filter-module {
                    padding: 22px 16px;
                    border-radius: 18px;
                }

                .filter-heading {
                    align-items: flex-start;
                    flex-direction: column;
                    gap: 8px;
                }

                .filter-heading h2 {
                    font-size: 24px;
                }

                .filter-heading p {
                    text-align: left;
                }

                .filter-search-form {
                    flex-direction: column;
                    border-radius: 20px;
                    padding: 12px;
                }

                .filter-search-field {
                    width: 100%;
                }

                .filter-search-submit {
                    width: 100%;\;
    content = content.replace(oldResponsiveMatch[0], newResponsive);
    console.log('Replaced responsive CSS successfully.');
} else {
    console.log('Could not match responsive CSS block.');
}

fs.writeFileSync(path, content, 'utf8');
