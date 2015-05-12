function getLink(link, get){
    var token = $('#current_token').val();
    if(typeof get != 'undefined') {
        if(!token) {
            return '/index.php?route=' + link + '&' + get;
        } else {
            return '/index.php?route=' + link + '&token=' + token + '&' + get;
        }
    } else {
        if(!token) {
            return '/index.php?route=' + link;
        } else {
            return '/index.php?route=' + link + '&token=' + token;
        }
    }
}

$.fn.serializeObject = function() {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};