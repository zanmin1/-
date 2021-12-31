function SelUnit(obj,options,e) {
    var ths = obj;
    var dal = '<div class="_citys"><span title="关闭" id="cColse" >×</span><ul id="_citysheng" class="_citys0"><li class="citySel" id="sheng">楼栋</li><li id="shi">单元房屋</li></ul><div id="_citys0" class="_citys1"></div><div style="display:none" id="_citys1" class="_citys1"></div></div>';
    Iput.show({ id: ths, event: e, content: dal,width:"470"});
    $("#cColse").click(function () {
        Iput.colse();
    });
    var tb_province = [];
    //var b = global_data;
	try{
		$.ajax({
			url: options.contextPath + '/mobile/unitChoose/getAreaListData.mhtml',
			type: "get",
			data:{
				estateId : options.estateId
			},
			async:false,
			dataType:"jsonp",
			jsonp: "callback",
			jsonpCallback:"jsonpCallback1",
			success: function(data){
				//console.log(data);
				global_data = data;
				var b = data;
				for (var i = 0, len = b.length; i < len; i++) {
					tb_province.push('<a data-level="0" data-id="' + b[i]['id'] + '" data-name="' + b[i]['name'] + '">' + b[i]['name'] + '</a>');
				}
				$("#_citys0").append(tb_province.join(""));
				$("#_citys0 a").click(function () {
					var g = getBuilding($(this));
					$("#_citys1 a").remove();
					$("#_citys1").append(g);
					$("._citys1").hide();
					$("._citys1:eq(1)").show();
					var lev = $(this).data("name");
					var buildingId = $(this).data("id");
					$("#city").html($(this).data("name")).css("color","#333");
					$("#sheng").html(lev);
					$("#hproper").remove();
					$("#harea").remove();
					if (document.getElementById("hcity") == null) {
						var hcitys = $('<input>', {
							type: 'hidden',
							name: "hcity",
							"data-id": $(this).data("id"),
							id: "hcity",
							val: lev
						});
						$(ths).after(hcitys);
					}
					else {
						$("#hcity").val(lev);
						$("#hcity").attr("data-id", $(this).data("id"));
					}
					$("#_citys1 a").click(function () {
						var lev =  $(this).data("name");
						var unitId = $(this).data("id");
						$("#shi").html(lev);
						$("#harea").remove();
						if (document.getElementById("hproper") == null) {
							var hcitys = $('<input>', {
								type: 'hidden',
								name: "hproper",
								"data-id": $(this).data("id"),
								id: "hproper",
								val: lev
							});
							$(ths).after(hcitys);
						}
						else {
							$("#hproper").attr("data-id", $(this).data("id"));
							$("#hproper").val(lev);
						}
						var bc = $("#hcity").val();
						var retunObj = {
							'buildingId':buildingId,
							'buildingName':bc,
							'unitId':unitId,
							'unitName':lev
						};
						new options.callBack(retunObj);
						//$("#city").html(bc+ "-" + $(this).data("name")).css("color","#333");
						Iput.colse();
						/*
						var ar = getBuildUnit($(this));

						//$("#_citys2 a").remove();
						//$("#_citys2").append(ar);
						$("._citys1").hide();
						$("._citys1:eq(2)").show();

						$("#_citys1 a").click(function () {
							var lev = $(this).data("name");
							$("#xian").html(lev);
							if (document.getElementById("harea") == null) {
								var hcitys = $('<input>', {
									type: 'hidden',
									name: "harea",
									"data-id": $(this).data("id"),
									id: "harea",
									val: lev
								});
								$(ths).after(hcitys);
							}
							else {
								$("#harea").val(lev);
								$("#harea").attr("data-id", $(this).data("id"));
							}
							var bc = $("#hcity").val();
							var bp = $("#hproper").val();
							$("#city").html(bc + "-" + bp + "-" + $(this).data("name")).css("color","#333");
							Iput.colse();
						});
						*/
					});
				});
				$("#_citysheng li").click(function () {
					$("#_citysheng li").removeClass("citySel");
					$(this).addClass("citySel");
					var s = $("#_citysheng li").index(this);
					$("._citys1").hide();
					$("._citys1:eq(" + s + ")").show();
				});
			},
			error:function(data){
			}
		});
	} catch(e) {
		alert(e.message);
	}
}

var global_data;

function getBuilding(obj) {
    var c = obj.data('id');
    var e = global_data;
    var f;
    var g = '';
    for (var i = 0, plen = e.length; i < plen; i++) {
        if (e[i]['id'] == parseInt(c)) {
            f = e[i]['city'];
            break
        }
    }
    for (var j = 0, clen = f.length; j < clen; j++) {
        g += '<a data-level="1" data-id="' + f[j]['id'] + '" data-name="' + f[j]['name'] + '" title="' + f[j]['name'] + '">' + f[j]['name'] + '</a>'
    }
    $("#_citysheng li").removeClass("citySel");
    $("#_citysheng li:eq(1)").addClass("citySel");
    return g;
}
function getBuildUnit(obj) {
    var c = obj.data('id');
    var e = area;
    var f = [];
    var g = '';
    for (var i = 0, plen = e.length; i < plen; i++) {
        if (e[i]['pid'] == parseInt(c)) {
            f.push(e[i]);
        }
    }
    for (var j = 0, clen = f.length; j < clen; j++) {
        g += '<a data-level="1" data-id="' + f[j]['id'] + '" data-name="' + f[j]['name'] + '" title="' + f[j]['name'] + '">' + f[j]['name'] + '</a>'
    }

    $("#_citysheng li").removeClass("citySel");
    $("#_citysheng li:eq(2)").addClass("citySel");
    return g;
}