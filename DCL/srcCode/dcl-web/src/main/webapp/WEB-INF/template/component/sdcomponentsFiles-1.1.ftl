
<script>

    function fmoney(s) {
         s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(2) + "";
         var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1];
         t = "";
         for (i = 0; i < l.length; i++) {
                t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
         }
        return t.split("").reverse().join("") + "." + r;
        }


</script>