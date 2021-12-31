<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    String fullPath = basePath + path;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>村务政务</title>
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/public.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/detail.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/search.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/button.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/form.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/list.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/basic/basic-layui/css/layer.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/notice.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/index.css"/>
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/css/gzh-index2.css"/>
    <script src="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/layui.js"></script>
</head>

<body class="bg-cor-f5">
<div class="layui-contain">
    <div class="layui-row">
        <div class="layui-col-xs12 bg-fff pb15 bs">
            <div class="height-44 pl25 pr25 bor-bottom flex flex-ac">
                <i class="xczl-icon img100">
                    <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/notice/title-icon.png" alt="">
                </i>
                <em class="cor-4d font-size-18 font-bold ml10">乡村自治</em>
            </div>
            <div class="flex mt15 xczl-btn-box  pl15 pr15 bs mb5" id="xczz">
                <div class="xczl-zyz-box flex1">
                    <i class="xczl-bb-shadow xczl-bb-shadow4 posi-abso"></i>
                    <a href="javascript:void(0);" onclick="jump('')" class="height-p100 flex flex-ac xczl-bb-bj4">
                        <i></i>
                        <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff flex1 text-align-c">通知公告</p>
                    </a>
                </div>
                <div class="xczl-zyz-box flex1 ml15">
                    <i class="xczl-bb-shadow xczl-bb-shadow5 posi-abso"></i>
                    <a href="javascript:void(0);" onclick="jump('')" class="height-p100 flex flex-ac xczl-bb-bj5">
                        <i></i>
                        <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff flex1 text-align-c">三务公开</p>
                    </a>
                </div>
            </div>
            <!-- 标题 -->
            <div class="height-44 pl25 pr25 bor-bottom flex flex-ac">
                <i class="xczl-icon img100">
                    <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx-gongzhong/images/notice/title-icon.png" alt="">
                </i>
                <em class="cor-4d font-size-18 font-bold ml10">村民共治</em>
            </div>
            <div class="mt15 flex xczl-btn-box  pl15 pr15 bs" id="cmgz">
                <div class="xczl-bb-left">
                    <i class="xczl-bb-shadow xczl-bb-shadow1 posi-abso"></i>
                    <a href="javascript:void(0);" onclick="jump('null')"
                       class="xczl-bb-bj1 height-p100 posi-rela flex flex-clm flex-ac flex-jc">
                        <i></i>
                        <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff mt15">随手拍</p>
                    </a>
                </div>
                <div class="xczl-bb-right flex1 ml15">
                    <div class="xczl-bbr-top">
                        <a href="javascript:void(0);" onclick="jump('null')"
                           class="xczl-bb-bj3 height-p100 posi-rela flex flex-ac flex-jc">
                            <i></i>
                            <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff">我的积分</p>
                        </a>
                    </div>
                    <div class="xczl-bbr-bottom mt15">
                        <i class="xczl-bb-shadow xczl-bb-shadow2 posi-abso"></i>
                        <a href="javascript:void(0);" onclick="jump('null')"
                           class="xczl-bb-bj2 height-p100 posi-rela flex flex-ac flex-jc">
                            <i></i>
                            <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff">积分商城</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-xs12">
            <div class="flex flex-ac flex-jb height-44 pl15 pr15 bs">
                <p class="posi-rela text-lh1 font-size-15 cor-333 pl15"><i class="notic-bar-ext1"></i>活动列表</p>
                <a href="javascript:;" class="layui-btn layui-btn-ext1"><i class="icon-more-ext1 pl15"
                                                                           onclick="moreActivity()"></i></a>
            </div>
            <div class="xczl-box1 layui-row bg-fff">
                <div class="layui-row bg-fff">
                    <div class="hide zwsj-box width-p100 height-p100 flex flex-ac flex-jc posi-abso posi-top-0"
                         id="tbNone">
                        <p class="font-size-14 cor-ccc text-lh1">暂无数据</p>
                    </div>
                    <div class="layui-col-xs12 pl15 pr15" id="tbData">
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- 弹窗 -->
<div class="div-tc hide">
    <div class="div-tc-box">
        <i class="div-tc-box-i layui-icon layui-icon-close font-bold"></i>
        <p class="font-size-18 cor-4d font-bold text-align-c text-lh1">很遗憾</p>
        <p class="text-lh1 font-size-16 cor-4d text-align-c mt30 mb15">非志愿者无法参与积分活动！</p>
        <div class="text-align-c" id="zyzzc">
            <button class="text-lh1 layui-btn xczl-buttoms font-size-14 layui-this pt10 pb10">前往注册志愿者</button>
        </div>
    </div>
</div>
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
<script>
    $(function () {

        getUrl()
        loadActivity()
    })
    layui.use('layer', function () {
        var layer = layui.layer;
    });
    $(".layui-icon-close").on("click", function () {
        $(".div-tc").addClass('hide');
        console.log("back")
    })

    function isWeChat() {
        var ua = navigator.userAgent.toLowerCase();

        var type = ua.match(/MicroMessenger/i) == "micromessenger" || window.__wxjs_environment == 'miniprogram'
        if (type) {
            return 'spt'
        } else {
            return 'xygj'
        }
    }

    function jump(url) {
        console.log(url)
        if (url == 'null' || url == '' || url == null) {
            layer.msg('暂未开放', {
                time: 0, //20s后自动关闭
                btn: ['关闭']
            });
            return
        }
        var flag = isWeChat()
        var isapp = ''
        if (flag == 'xygj') {
            isapp = 'token=${token}&app=app'
        }
        if (url.indexOf("?") == -1) {   //链接没有带参数
            location.href = url + '?' + isapp
        } else {
            location.href = url + '&' + isapp
        }
    }

    function activityDetail(id) {
        var url = '${$WECHAT_DOMAIN}/wap/volunteer/activity/signUp/detail.mhtml?id=' + id;
        $.ajax({
            type: 'post',
            url: '${$WECHAT_DOMAIN}/wap/volunteer/user/isVolunteer.mhtml?jsonpcallback=""',
            data: {
                token: '${token}'
            },
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data && (data.volunteer == null || data.volunteer == 'null')) {
                    $(".div-tc").removeClass('hide');
                } else {
                    jump(url);
                }

            },
            error: function (data) {
                console.log('获取志愿者信息数据连接超时！');
            },
            complete: function () {
            }
        });
    }

    function moreActivity() {
        var url = '<%=path%>/public/wap/ruralGovernanceControllerApp/moreIndex.json';
        jump(url)
    }

    function loadActivity() {
        var map = {
            page: 1,
            rows: 3,
            regionCode: "${orgCode}"
            // regionCode:"660101001001"
        };
        var url = '${$WECHAT_DOMAIN}/public/wap/ruralGovernanceControllerApp/listDataForJsonp.json';
        $.ajax({
            type: 'GET',
            url: url,
            data: map,
            dataType: 'jsonp',
            jsonp: "jsoncallback",
            success: function (data) {
                if (data.total > 0) {
                    var rows = data.rows
                    var Activitys = ''

                    for (let i = 0; i < rows.length; i++) {
                        // 将职称名称根据;拆分成多个i标签显示

                        var photo = rows[i].attPath == null ? '${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-list-default-ext2.png' : '${$IMG_DOMAIN}' + rows[i].attPath
                        var signTimeStartStr = rows[i].signTimeStartStr.substring(0, 10);
                        var signTimeEndStr = rows[i].signTimeEndStr.substring(0, 10);
                        var content = rows[i].content == null ? ' ' : rows[i].content
                        var title = rows[i].title == null ? ' ' : rows[i].title
                        var serviceTypeCN = rows[i].serviceTypeCN == null ? ' ' : rows[i].serviceTypeCN
                        var limitPartiCount = rows[i].limitPartiCount == null ? '0' : rows[i].limitPartiCount
                        var currentPartiCount = rows[i].currentPartiCount == null ? '0' : rows[i].currentPartiCount

                        var now = new Date();
                        var signStatus = '';
                        if (new Date(rows[i].signTimeStart) > now) {
                            signStatus =
                                `<i class="xczl-apply-type xczl-wbm text-align-c line-height-19 cor-fff border-radius-4">未开始</i>`
                        } else if (new Date(rows[i].signTimeEnd) > now) {
                            signStatus =
                                `<i class="xczl-apply-type xczl-ybm text-align-c line-height-19 cor-fff border-radius-4">报名中</i>`
                        }
                        if (new Date(rows[i].signTimeEnd) < now) {
                            signStatus =
                                `<i class="xczl-apply-type xczl-ygq text-align-c line-height-19 cor-fff border-radius-4" style="background-color: grey">已结束</i>`
                        }
                        if (limitPartiCount == currentPartiCount) {
                            signStatus =
                                `<i class="xczl-apply-type xczl-ybm text-align-c line-height-19 cor-fff border-radius-4" style="background-color: grey">已结束</i>`
                        }


                        Activitys += `
                        <div class="layui-col-xs12 bor-btm-f0 bg-fff flex mt15 pb15"  onclick="activityDetail(` + rows[i].id + `)">
                            <div class="width-120">
                                <div class="pic-wrap-ext1 notice-s7">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i border-radius-2">
                                            <div class="posi-abso gzh-default-pic flex flex-ac flex-jc">
                                                <img src="` + photo + `">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="flex1 ml15 overflow-h">
                                <div class="flex">
                                    <p class="flex1 mr5 line-height-19 cor-4d font-size-14 text-line-c1">` + title + `</p>
                                    ` + signStatus + `
                                </div>
                                <p class="font-size-12 cor-blue3 text-line-c1 mt5">服务类型: <span>` + serviceTypeCN + `</span></p>
                                <p class="font-size-12 cor-4d text-line-c2 mt10">` + content + `</p>
                                <p class="font-size-12 cor-999 text-line-c1 mt10">` + signTimeStartStr + ` — ` + signTimeEndStr + `</p>
                            </div>
                        </div>

                        `
                    }
                    $("#tbData").html(Activitys)
                } else {
                    $('#tbNone').removeClass('hide');
                    $('#tbData').hide();
                }

            },
            error: function (data) {
                console.log("获取列表数据连接超时！");
            },
            complete: function () {
            }
        })
    }

    // 公告下面的按钮
    function getUrl() {
        var platform = isWeChat()
        $.ajax({
            type: 'POST',
            url: '<%=path%>/public/wap/szshAppHome/getModularContentNew.jhtml',
            data: {
                useType: 'xczl',
                orgCode: "${orgCode}",
                type: '7',  //导航栏
                platform: platform,
            },
            success: function (data) {
                var html = ''
                var myRegionCode = '${orgCode}'
                if (myRegionCode.length > 10) {
                    myRegionCode = myRegionCode.substring(0, 9)
                }
                if (data != null) {
                    var dvModulars = data.dvModulars
                    if (dvModulars != null) {
                        for (var j = 0; j < dvModulars.length; j++) {
                            if (j === 0) {
                                var modularContents = dvModulars[j].modularContents
                                //0志愿者注册，1通知公告，2三务公开,3随手拍,4积分活动,5积分商城
                                var url = [null, null, null, null, null, null]
                                for (var l = 0; modularContents && l < modularContents.length && l <= 5; l++)
                                    if (modularContents[l]) {
                                        url[l] = modularContents[l].url
                                    }

                                html +=
                                    `
                                    <div class="xczl-zyz-box flex1">
                    <i class="xczl-bb-shadow xczl-bb-shadow4 posi-abso"></i>
                    <a href="javascript:void(0);" onclick="jump('` + url[1] + `')"  class="height-p100 flex flex-ac xczl-bb-bj4">
                        <i></i>
                        <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff flex1 text-align-c">通知公告</p>
                    </a>
                </div>
                <div class="xczl-zyz-box flex1 ml15">
                    <i class="xczl-bb-shadow xczl-bb-shadow5 posi-abso"></i>
                    <a href="javascript:void(0);" onclick="jump('` + url[2] + `')" class="height-p100 flex flex-ac xczl-bb-bj5">
                        <i></i>
                        <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff flex1 text-align-c">三务公开</p>
                    </a>
                </div>
                                    `
                                $('#xczz').html(html);
                                var str = ""
                                str +=
                                    `
                                    <div class="xczl-bb-left">
                    <i class="xczl-bb-shadow xczl-bb-shadow1 posi-abso"></i>
                    <a href="javascript:void(0);" onclick="jump('` + url[3] + `')" class="xczl-bb-bj1 height-p100 posi-rela flex flex-clm flex-ac flex-jc">
                        <i></i>
                        <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff mt15">随手拍</p>
                    </a>
                </div>
                <div class="xczl-bb-right flex1 ml15">
                    <div class="xczl-bbr-top">
                        <a href="javascript:void(0);" onclick="jump('` + url[4] + `')" class="xczl-bb-bj3 height-p100 posi-rela flex flex-ac flex-jc">
                            <i></i>
                            <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff">我的积分</p>
                        </a>
                    </div>
                    <div class="xczl-bbr-bottom mt15">
                        <i class="xczl-bb-shadow xczl-bb-shadow2 posi-abso"></i>
                        <a href="javascript:void(0);" onclick="jump('` + url[5] + `')" class="xczl-bb-bj2 height-p100 posi-rela flex flex-ac flex-jc">
                            <i></i>
                            <p class="letter-spacing-1_5 font-size-17 font-bold cor-fff">积分商城</p>
                        </a>
                    </div>
                </div>
                                    `
                                $("#cmgz").html(str)
                                var zyzzc = ''
                                zyzzc += `<button class="text-lh1 layui-btn xczl-buttoms font-size-14 layui-this pt10 pb10" onclick="jump('` + url[0] + `&fromRegionCode=` + myRegionCode + `')">前往注册志愿者</button>`
                                $("#zyzzc").html(zyzzc)
                            }
                        }
                    }
                }
            },
            error: function (data) {

            },
            complete: function () {
            }
        });
    }

</script>
</body>
</html>