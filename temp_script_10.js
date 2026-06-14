
        (function() {
            try {
                var startDate = sessionStorage.getItem('hs_startDate');
                var endDate   = sessionStorage.getItem('hs_endDate');
                var pickup    = sessionStorage.getItem('hs_pickup');
                var returnL   = sessionStorage.getItem('hs_returnLoc');
                if (!startDate) return;

                // Fill date fields (split datetime-local → date + time)
                function splitDT(dtStr) {
                    if (!dtStr) return {date:'', time:''};
                    var parts = dtStr.split('T');
                    return { date: parts[0] || '', time: parts[1] ? parts[1].substring(0,5) : '' };
                }
                var sd = splitDT(startDate);
                var ed = splitDT(endDate);

                var pickupDateEl  = document.getElementById('pickupdate');
                var pickupTimeEl  = document.getElementById('pickuptime');
                var returnDateEl  = document.getElementById('returndate');
                var returnTimeEl  = document.getElementById('returntime');
                var pickupLocEl   = document.getElementById('pickuplocation');
                var returnLocEl   = document.getElementById('returnlocation');

                if (pickupDateEl && sd.date) pickupDateEl.value = sd.date;
                if (pickupTimeEl && sd.time) pickupTimeEl.value = sd.time;
                if (returnDateEl && ed.date) returnDateEl.value = ed.date;
                if (returnTimeEl && ed.time) returnTimeEl.value = ed.time;

                // Set location selects (match value or fallback to last option)
                function setSelectValue(sel, val) {
                    if (!sel || !val) return;
                    for (var i = 0; i < sel.options.length; i++) {
                        if (sel.options[i].value.toLowerCase().indexOf(val.substring(0,8).toLowerCase()) >= 0) {
                            sel.selectedIndex = i; return;
                        }
                    }
                }
                setSelectValue(pickupLocEl, pickup);
                setSelectValue(returnLocEl, returnL);

                // Clear so it doesn't re-apply on back navigation
                sessionStorage.removeItem('hs_startDate');
                sessionStorage.removeItem('hs_endDate');
                sessionStorage.removeItem('hs_pickup');
                sessionStorage.removeItem('hs_returnLoc');

                // Auto-advance logic has been removed as per user request
                // setTimeout(function() {
                //     var nextBtn = document.querySelector('a[href="#next"]') ||
                //                   document.querySelector('.actions a[href*="next"]') ||
                //                   document.querySelector('.wizard-next-btn') ||
                //                   document.querySelector('[data-action="next"]');
                //     if (nextBtn) nextBtn.click();
                // }, 800);

            } catch(ex) {}
        })();
        