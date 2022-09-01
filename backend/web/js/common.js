//加
mathadd=function(a,b){
    var c, d, e;
    try {
        c = a.toString().split(".")[1].length;
    } catch (f) {
        c = 0;
    }
    try {
        d = b.toString().split(".")[1].length;
    } catch (f) {
        d = 0;
    }
    return e = Math.pow(10, Math.max(c, d)), (mathmul(a, e) + mathmul(b, e)) / e;
};
//减
mathsub=function(a,b){
    var c, d, e;
    try {
        c = a.toString().split(".")[1].length;
    } catch (f) {
        c = 0;
    }
    try {
        d = b.toString().split(".")[1].length;
    } catch (f) {
        d = 0;
    }
    return e = Math.pow(10, Math.max(c, d)), (mathmul(a, e) - mathmul(b, e)) / e;
};
//乘
mathmul=function(a,b) {
    var c = 0,
        d = a.toString(),
        e = b.toString();
    try {
        c += d.split(".")[1].length;
    } catch (f) {}
    try {
        c += e.split(".")[1].length;
    } catch (f) {}
    return Number(d.replace(".", "")) * Number(e.replace(".", "")) / Math.pow(10, c);
};
//除
mathdiv=function(a,b) {
    var c, d, e = 0,
        f = 0;
    try {
        e = a.toString().split(".")[1].length;
    } catch (g) {}
    try {
        f = b.toString().split(".")[1].length;
    } catch (g) {}
    return c = Number(a.toString().replace(".", "")), d = Number(b.toString().replace(".", "")), mathmul(c / d, Math.pow(10, f - e));
};
//格式化金额，money:金额,digit:保留位数, thousand:是否显示千位分隔
function formatMoney(money,digit,thousand) {
    digit = digit > 0 && digit <= 20 ? digit : 2;
    money = parseFloat(money).toFixed(digit);
    if(thousand){
        var integerArr = money.split(".")[0].split("").reverse();
        var decimals = money.split(".")[1];
        tempArr = "";
        for (var i=0,k=integerArr.length;i<k;i++) {
            var cammaTag = (i+1)%3==0 && (i+1)!=k ? "," : "";
            tempArr += integerArr[i] + cammaTag;
        }
        money = tempArr.split("").reverse().join("") + "." + decimals;
    }
    return money;
}

//截取字符串
function strCut(string,length) {
    if(string.length < length){
        return string;
    }else{
        return string.substring(0,length)+"...";
    }
}