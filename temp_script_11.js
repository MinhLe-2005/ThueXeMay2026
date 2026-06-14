
        window.activePackage = null;
        
        function setQuickReturnDate(days, autoEvent = false) {
            const pickupInput = document.getElementById('pickupdate');
            const returnInput = document.getElementById('returndate');
            if (!pickupInput.value) {
                alert('Vui lòng chọn Ngày nhận xe trước!');
                return;
            }
            
            if (!autoEvent) {
                window.activePackage = days === 7 ? 'week' : (days === 30 ? 'month' : null);
            }
            
            const date = new Date(pickupInput.value);
            date.setDate(date.getDate() + days);
            
            const yyyy = date.getFullYear();
            const mm = String(date.getMonth() + 1).padStart(2, '0');
            const dd = String(date.getDate()).padStart(2, '0');
            returnInput.value = yyyy + '-' + mm + '-' + dd;
            
            updateQuickButtonsStyle(days);
            
            // Dispatch change event to trigger differenceInDays calculation
            if (!autoEvent) {
                returnInput.dispatchEvent(new Event('change'));
            }
        }
        
        function updateQuickButtonsStyle(days) {
            const btnWeek = document.getElementById('btn-quick-week');
            const btnMonth = document.getElementById('btn-quick-month');
            
            if (btnWeek) {
                if (days === 7) {
                    btnWeek.style.background = '#b59349';
                    btnWeek.style.color = '#fff';
                    
                } else {
                    btnWeek.style.background = '#fff';
                    btnWeek.style.color = '#b59349';
                    
                }
            }
            
            if (btnMonth) {
                if (days === 30) {
                    btnMonth.style.background = '#b59349';
                    btnMonth.style.color = '#fff';
                    
                } else {
                    btnMonth.style.background = '#fff';
                    btnMonth.style.color = '#b59349';
                    
                }
            }
        }
        
        document.addEventListener('DOMContentLoaded', function() {
            const pickupInput = document.getElementById('pickupdate');
            const returnInput = document.getElementById('returndate');
            
            pickupInput.addEventListener('change', function() {
                if (window.activePackage === 'week') {
                    setQuickReturnDate(7, true);
                    returnInput.dispatchEvent(new Event('change'));
                } else if (window.activePackage === 'month') {
                    setQuickReturnDate(30, true);
                    returnInput.dispatchEvent(new Event('change'));
                }
            });
            
            returnInput.addEventListener('change', function() {
                if (pickupInput.value && returnInput.value) {
                    const start = new Date(pickupInput.value);
                    const end = new Date(returnInput.value);
                    const diffTime = Math.abs(end - start);
                    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
                    
                    if (diffDays === 7) {
                        window.activePackage = 'week';
                        updateQuickButtonsStyle(7);
                    } else if (diffDays === 30) {
                        window.activePackage = 'month';
                        updateQuickButtonsStyle(30);
                    } else {
                        window.activePackage = null;
                        updateQuickButtonsStyle(0); // clear both
                    }
                }
            });
        });
        