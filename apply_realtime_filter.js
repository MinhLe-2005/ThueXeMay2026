const fs = require('fs');

const path = 'src/main/webapp/motorbikes.jsp';
let content = fs.readFileSync(path, 'utf8');

// 1. Hide the apply button
content = content.replace(
    '<button type="button" class="filter-apply-button" onclick="showResults()">',
    '<button type="button" class="filter-apply-button" onclick="showResults()" style="display: none;">'
);

// 2. Add showResults() to toggleSelection
const toggleSelectionOld = `function toggleSelection(button) {
                                                    button.classList.toggle('selected');
                                                    updateSelectedFilters();
                                                    
                                                    // Auto-close dropdown when an option is selected
                                                    if (currentOpenOptions) {
                                                        currentOpenOptions.classList.remove('show-options');
                                                        currentOpenOptions.previousElementSibling.classList.remove('open');
                                                        currentOpenOptions = null;
                                                    }
                                                }`;
const toggleSelectionNew = `function toggleSelection(button) {
                                                    button.classList.toggle('selected');
                                                    updateSelectedFilters();
                                                    
                                                    // Auto-close dropdown when an option is selected
                                                    if (currentOpenOptions) {
                                                        currentOpenOptions.classList.remove('show-options');
                                                        currentOpenOptions.previousElementSibling.classList.remove('open');
                                                        currentOpenOptions = null;
                                                    }
                                                    
                                                    // Thêm auto-submit
                                                    showResults();
                                                }`;
content = content.replace(toggleSelectionOld, toggleSelectionNew);

// 3. Fix updateSelectedFilters and Vietnamese strings
const updateFiltersOldStr1 = "header.textContent = 'Dang l?c theo';";
const updateFiltersNewStr1 = "header.textContent = 'Đang lọc theo';";
content = content.replace(updateFiltersOldStr1, updateFiltersNewStr1);

const updateFiltersOldStr2 = "clearAllButton.innerHTML = '<span>x B? ch?n t?t c?</span>';";
const updateFiltersNewStr2 = "clearAllButton.innerHTML = '<span>× Bỏ chọn tất cả</span>';";
content = content.replace(updateFiltersOldStr2, updateFiltersNewStr2);

// 4. Add showResults() to removeSelectedFilter
const removeSelectedOld = `function removeSelectedFilter(filterDiv, text) {
                                                    var filterOptionButtons = document.querySelectorAll('.filter-options button');
                                                    filterOptionButtons.forEach(function (button) {
                                                        if (button.textContent.trim() === text) {
                                                            button.classList.remove('selected');
                                                        }
                                                    });
                                                    filterDiv.remove();
                                                    updateSelectedFilters();
                                                }`;
const removeSelectedNew = `function removeSelectedFilter(filterDiv, text) {
                                                    var filterOptionButtons = document.querySelectorAll('.filter-options button');
                                                    filterOptionButtons.forEach(function (button) {
                                                        if (button.textContent.trim() === text) {
                                                            button.classList.remove('selected');
                                                        }
                                                    });
                                                    filterDiv.remove();
                                                    updateSelectedFilters();
                                                    showResults();
                                                }`;
content = content.replace(removeSelectedOld, removeSelectedNew);

// 5. Add showResults() to clearAllSelections
const clearAllOld = `function clearAllSelections() {
                                                    var selectedButtons = document.querySelectorAll('.filter-options button.selected');
                                                    selectedButtons.forEach(function (button) {
                                                        button.classList.remove('selected');
                                                    });
                                                    updateSelectedFilters();
                                                }`;
const clearAllNew = `function clearAllSelections() {
                                                    var selectedButtons = document.querySelectorAll('.filter-options button.selected');
                                                    selectedButtons.forEach(function (button) {
                                                        button.classList.remove('selected');
                                                    });
                                                    updateSelectedFilters();
                                                    showResults();
                                                }`;
content = content.replace(clearAllOld, clearAllNew);

// 6. Add DOMContentLoaded for state restoration
const restoreStateScript = `
                                                document.addEventListener('DOMContentLoaded', function() {
                                                    const params = new URLSearchParams(window.location.search);
                                                    
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

// Insert restoreStateScript before the end of the script tag
const endScriptTag = '</script>\n</body>';
content = content.replace(endScriptTag, restoreStateScript + '\n' + endScriptTag);

fs.writeFileSync(path, content, 'utf8');
fs.writeFileSync('d:/A_JAVA_Ki_5/SWP391/motor-booking/motorcycle-booking-system-main/target/MotorcyleHiringProject-1.0-SNAPSHOT/motorbikes.jsp', content, 'utf8');
console.log("Auto-submit filtering and state restoration implemented successfully.");
