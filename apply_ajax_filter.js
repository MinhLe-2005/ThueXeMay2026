const fs = require('fs');

const path = 'src/main/webapp/motorbikes.jsp';
let content = fs.readFileSync(path, 'utf8');

const oldShowResultsTail = `                                                    // Remove the trailing '&'
                                                    url = url.slice(0, -1);

                                                    window.location.href = url;
                                                }`;

const newShowResultsTail = `                                                    // Remove the trailing '&'
                                                    if (url.endsWith('&')) {
                                                        url = url.slice(0, -1);
                                                    }
                                                    if (url === 'searchCriteria?') {
                                                        url = 'motorcycle';
                                                    }

                                                    fetchAndUpdateGrid(url);
                                                }

                                                function fetchAndUpdateGrid(url) {
                                                    const grid = document.getElementById('motorcycleContent');
                                                    if (grid) {
                                                        grid.style.opacity = '0.5';
                                                        grid.style.transition = 'opacity 0.3s ease';
                                                    }
                                                    
                                                    window.history.pushState({}, '', url);
                                                    
                                                    fetch(url)
                                                        .then(response => response.text())
                                                        .then(html => {
                                                            const parser = new DOMParser();
                                                            const doc = parser.parseFromString(html, 'text/html');
                                                            
                                                            const newContent = doc.getElementById('motorcycleContent');
                                                            if (newContent && grid) {
                                                                grid.innerHTML = newContent.innerHTML;
                                                                grid.style.opacity = '1';
                                                            }
                                                            
                                                            const newPagination = doc.querySelector('.block-27');
                                                            const currentPagination = document.querySelector('.block-27');
                                                            if (newPagination && currentPagination) {
                                                                currentPagination.innerHTML = newPagination.innerHTML;
                                                            }
                                                        })
                                                        .catch(error => {
                                                            console.error('Error fetching results:', error);
                                                            if (grid) grid.style.opacity = '1';
                                                        });
                                                }`;

content = content.replace(oldShowResultsTail, newShowResultsTail);

const oldGoToPage = `                                                function goToPage(index) {
                                                    const urlParams = new URLSearchParams(window.location.search);
                                                    urlParams.set('index', index);
                                                    window.location.search = urlParams.toString();
                                                }`;

const newGoToPage = `                                                function goToPage(index) {
                                                    const urlParams = new URLSearchParams(window.location.search);
                                                    urlParams.set('index', index);
                                                    
                                                    const basePath = window.location.pathname.split('/').pop() || 'motorcycle';
                                                    const url = basePath + '?' + urlParams.toString();
                                                    
                                                    fetchAndUpdateGrid(url);
                                                    
                                                    const listSection = document.querySelector('.list');
                                                    if (listSection) {
                                                        listSection.scrollIntoView({ behavior: 'smooth' });
                                                    }
                                                }`;

content = content.replace(oldGoToPage, newGoToPage);

// When browser back/forward buttons are pressed, we should ideally fetch the grid for that URL.
// We can add a popstate listener.
const popStateScript = `
                                                window.addEventListener('popstate', function() {
                                                    fetchAndUpdateGrid(window.location.href);
                                                    
                                                    // Cập nhật lại giao diện bộ lọc tương ứng với URL (khôi phục trạng thái visual)
                                                    const params = new URLSearchParams(window.location.search);
                                                    
                                                    document.querySelectorAll('.button-item-option').forEach(btn => {
                                                        btn.classList.remove('selected');
                                                    });
                                                    
                                                    function restoreState(paramName, sectionId) {
                                                        if (params.has(paramName)) {
                                                            const values = params.get(paramName).split(',');
                                                            const container = document.getElementById(sectionId);
                                                            if(container) {
                                                                const buttons = container.querySelectorAll('.button-item-option');
                                                                buttons.forEach(btn => {
                                                                    if (values.includes(btn.getAttribute('data-id'))) {
                                                                        btn.classList.add('selected');
                                                                    }
                                                                });
                                                            }
                                                        }
                                                    }
                                                    
                                                    restoreState('priceRanges', 'priceOptions');
                                                    restoreState('brands', 'brandOptions');
                                                    restoreState('categories', 'categoryOptions');
                                                    restoreState('displacements', 'massOptions');
                                                    restoreState('demands', 'needOptions');
                                                    
                                                    updateSelectedFilters();
                                                });
`;

const endScriptTag = '</script>\n</body>';
content = content.replace(endScriptTag, popStateScript + '\n' + endScriptTag);

fs.writeFileSync(path, content, 'utf8');
fs.writeFileSync('d:/A_JAVA_Ki_5/SWP391/motor-booking/motorcycle-booking-system-main/target/MotorcyleHiringProject-1.0-SNAPSHOT/motorbikes.jsp', content, 'utf8');
console.log("AJAX Real-time filtering implemented successfully!");
