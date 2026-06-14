
    function deduplicateDatalist(datalistId) {
        var datalist = document.getElementById(datalistId);
        if (!datalist) return;
        var options = datalist.getElementsByTagName('option');
        var seen = {};
        for (var i = options.length - 1; i >= 0; i--) {
            var val = options[i].value.trim();
            if (seen[val]) {
                datalist.removeChild(options[i]);
            } else {
                seen[val] = true;
            }
        }
    }
    document.addEventListener('DOMContentLoaded', function() {
        deduplicateDatalist('dispList');
        deduplicateDatalist('dispList2');
    });
