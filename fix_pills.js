const fs = require('fs');
const path = 'src/main/webapp/motorbikes.jsp';
let content = fs.readFileSync(path, 'utf8');

const oldUpdate = `                                                function updateSelectedFilters() {
                                                    var selectedButtons = document.querySelectorAll('.filter-options button.selected');
                                                    var selectedFilters = Array.from(selectedButtons).map(function (button) {
                                                        return {
                                                            text: button.textContent.trim(),
                                                            group: button.closest('.filter-group').querySelector('.filter-button').textContent.trim()
                                                        };
                                                    });
                                                    var selectedFiltersContainer = document.getElementById('selectedFilters');
                                                    selectedFiltersContainer.innerHTML = '';
                                                    if (selectedFilters.length > 0) {
                                                        var header = document.createElement('h2');
                                                        header.textContent = 'Đang lọc theo';
                                                        selectedFiltersContainer.appendChild(header);

                                                        var clearAllButton = document.createElement('div');
                                                        clearAllButton.className = 'selected-filter';
                                                        clearAllButton.innerHTML = '<span>× Bỏ chọn tất cả</span>';
                                                        clearAllButton.onclick = clearAllSelections;
                                                        selectedFiltersContainer.appendChild(clearAllButton)
                                                    }
                                                    selectedFilters.forEach(function (filter) {
                                                        var filterDiv = document.createElement('div');
                                                        filterDiv.className = 'selected-filter';
                                                        filterDiv.innerHTML = '<span>' + filter.group + ': ' + filter.text + '</span><span class="remove-filter" onclick="removeSelectedFilter(this.parentElement, \\'' + filter.text + '\\')">&#10006;</span>';
                                                        selectedFiltersContainer.appendChild(filterDiv);
                                                    });
                                                }`;

const newUpdate = `                                                function updateSelectedFilters() {
                                                    var selectedButtons = document.querySelectorAll('.filter-options button.selected');
                                                    var selectedFilters = Array.from(selectedButtons).map(function (button) {
                                                        return {
                                                            text: button.textContent.trim(),
                                                            group: button.closest('.filter-group').querySelector('.filter-label').textContent.trim()
                                                        };
                                                    });
                                                    var selectedFiltersContainer = document.getElementById('selectedFilters');
                                                    selectedFiltersContainer.innerHTML = '';
                                                    if (selectedFilters.length > 0) {
                                                        var header = document.createElement('h2');
                                                        header.textContent = 'Đang lọc theo';
                                                        selectedFiltersContainer.appendChild(header);

                                                        var clearAllButton = document.createElement('div');
                                                        clearAllButton.className = 'selected-filter clear-all-filter';
                                                        clearAllButton.style = 'cursor: pointer; background: #fee2e2 !important; color: #dc2626 !important; border-color: #fca5a5 !important; font-weight: 700;';
                                                        clearAllButton.innerHTML = '<span>× Bỏ chọn tất cả</span>';
                                                        clearAllButton.onclick = clearAllSelections;
                                                        selectedFiltersContainer.appendChild(clearAllButton)
                                                    }
                                                    selectedFilters.forEach(function (filter) {
                                                        var filterDiv = document.createElement('div');
                                                        filterDiv.className = 'selected-filter';
                                                        filterDiv.innerHTML = '<span><strong style="color: #9c7b39; font-weight: 800;">' + filter.group + ':</strong> ' + filter.text + '</span><span class="remove-filter" onclick="removeSelectedFilter(this.parentElement, \\'' + filter.text + '\\')">&#10006;</span>';
                                                        selectedFiltersContainer.appendChild(filterDiv);
                                                    });
                                                }`;

content = content.replace(oldUpdate, newUpdate);

fs.writeFileSync(path, content, 'utf8');
fs.writeFileSync('d:/A_JAVA_Ki_5/SWP391/motor-booking/motorcycle-booking-system-main/target/MotorcyleHiringProject-1.0-SNAPSHOT/motorbikes.jsp', content, 'utf8');
console.log("Pills fixed!");
