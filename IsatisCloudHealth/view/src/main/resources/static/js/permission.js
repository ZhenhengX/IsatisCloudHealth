// 获取当前登录用户的所有权限
function getPermission() {
    $.ajax({
        url: "/permission/findAllPermission",

        dataType: "json",

        type: "POST",

        success: function (resp) {
            return resp;
        }
    });
}