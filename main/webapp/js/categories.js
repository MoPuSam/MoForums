$(document).ready(function() {
    var json;
    var jsonArr = [];
    jQuery.ajax({
        type: "post",
        cache: false,
        url: '/category/select',
        dataType: "json",
        success: function(rt) { //alert(JSON.stringify(rt));
            json = JSON.stringify(rt);
            jsonArr = eval(json);
            //json = rt;
            // alert(json);
            //alert(jsonArr.length);
            var idPre = "selection";
            var flag = false; //默认不创建新的select
            var flag2 = false; //默认新的select下的option不存在.
            function guazai(index, id, $s ) {
                var jsonObject = [];
                var num = 0;
                //debugger;
                if (index === 1) {
                    jsonObject = jsonArr;
                    flag = true;
                    num = jsonObject.length;
                    var tempId ="", tempValue="", str="";
                    for (var i = 0; i < num; i++) {
                        tempValue = jsonObject[i].gcName;
                        tempId = idPre + index + jsonObject[i].gcId;
                        str += "<option value='" + tempValue + "' id = '" + tempId + "'>" + tempValue + "</option>";
                    }
                    $($s).append(str);
                }
                if (index === 2) {
                    jsonObject = jsonArr[id - 1].pategoryList;
                    //jsonObject = JSON.stringify(json[id - 1].pategoryList);
                    num = jsonObject.length;
                    var tempId ="", tempValue="", str="" ,pateId = "";
                    for (var i = 0; i < num; i++) {
                        tempValue = jsonObject[i].pType;
                        pateId = jsonObject[i].pId;
                        tempId = idPre + index + pateId;
                        str += "<option value='" + pateId + "' id = '" + tempId + "'>" + tempValue + "</option>";
                    }
                    $($s).append(str);
                }
            }
            guazai(1, 0, '#sel1');
            $("#sel1").change(function() {
                var str = '';
                if (!flag) {
                    $("#sel2 > option[value!='default']").remove();
                    flag2 = true;
                }
                if (flag) {
                    if (!flag2) {
                        str = "游戏类型：<select name='select2' id='sel2'></select>";
                        $(this).after(str);
                        flag2 = true;
                    }
                    str = "<option value='default' id='" + idPre + 2 + "'>----请选择-----</option>";
                    $("#sel2").append(str);
                    flag = false;
                }
                //获得当前对象的id
                var id = $(this).find("option:selected").attr("id");
                var i = idPre.length + 1;
                id = parseInt(id.substring(i, id.length));
                guazai(2, id, '#sel2');
            });
        },
        error: function(rt){}
    });
});