<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String uiDomain = request.getAttribute("uiDomain").toString();
    String ANOLE_COMPONENT_URL = request.getAttribute("ANOLE_COMPONENT_URL").toString();
%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="white">
    <meta name="format-detection" content="telephone=no">
    <!--Iphpone电话号码串识别 -->
    <meta http-equiv="x-rim-auto-match" content="none">
    <title>通知公告-文章详情</title>
    <!-- 网格选择插件 -->
    <link rel="stylesheet" href="${uiDomain}/web-assets/plugins/layui-v2.5.5/layui/css/layui.mobile.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/css/swiper.min.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/common/css/resetapp.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/public.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/detail.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/form.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/button.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/layer.css" />
    <link rel="stylesheet" href="${uiDomain}/app-assets/_jzfp/fujian-xczx/css/notice.css" />
</head>

<body class="bg-cor-f5">
    <!-- 添加被申请人-个人 -->
    <div class="layui-contain pb49">
        <div class="layui-row bg-fff">
            <div class="layui-col-xs12 pl15 pr15 pb10">
                <div class="layui-col-xs12">
                    <p class="font-size-17 cor-333 font-bold mt20">尹建业：深入学习贯彻党的十九届五中全会精神</p>
                </div>
                <div class="layui-col-xs12 flex flex-ac flex-jb mt10">
                    <p class="font-size-12 cor-999">发布机构名称全称<em class="ml15">2021-08-28</em> </p>
                    <ul class="flex flex-ac">
                        <li class="flex flex-ac">
                            <i class="notice-hot-i1"></i>
                            <p class="font-size-12 cor-666 ml5">1.2万</p>
                        </li>
                        <li class="flex flex-ac ml25">
                            <i class="notice-hot-i2"></i>
                            <p class="font-size-12 cor-666 ml5">1.1万</p>
                        </li>
                    </ul>
                </div>
                <div class="layui-col-xs12 mt10">
                    <div class="pic-wrap-ext1 notice-s2">
                        <div class="pic-wrap-c">
                            <div class="pic-wrap-i">
                                <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-3.png">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 mt20">
                    <div class="audio-ext1 flex flex-ac">
                        <button class="layui-btn layui-btn-ext1 audio-ext1-btn mr15"></button>
                        <span class="audio-ext1-i1 flex1"></span>
                        <p class="font-size-14 cor-blue8 ml13 mr13">26”</p>
                    </div>
                </div>
                <div class="layui-col-xs12 mt20">
                    <div class="swiper-container swiper-list-ext1">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="pic-wrap-ext1 notice-s3">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-3.png">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="pic-wrap-ext1 notice-s3">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-3.png">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="pic-wrap-ext1 notice-s3">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-3.png">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="pic-wrap-ext1 notice-s3">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-3.png">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="pic-wrap-ext1 notice-s3">
                                    <div class="pic-wrap-c">
                                        <div class="pic-wrap-i">
                                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/notice/ui-notice-pic-3.png">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-col-xs12 mt15">
                    <p class="font-size-14 cor-4d text-indent">尹建业：全省政法系统要切实把思想和行动统一到省委全会精神上来，坚持问题导向，聚焦重点任务，推动执法司法制约监督体系改革建设走深走实 尹建业：全省政法系统要切实把思想和行动统一到省委全会精神上。 问题导向，聚焦重点任务，推动执法司法制约监督体系改革建设走深走实 尹建业：全省政法系统要切实把思想和行动统一到省委全会精神上来，坚持问题导向，聚焦重点任务，推动执法司法制约监督体系改革建设走深走实 。</p>
                </div>
                <div class="layui-col-xs12 mt35">
                    <div class="layui-col-xs12 height-44 bg-cor-blue1 flex flex-ac mb8">
                        <div class="layui-col-xs9">
                            <div class="f-peo-ext1 flex flex-ac ml10">
                                <div class="f-peo-ext1-i">
                                    <div class="f-peo-ext1-it1">
                                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-upload-files-p1.png">
                                    </div>
                                </div>
                                <p class="font-size-13 cor-4d ml15">1.相关附件.doc</p>
                            </div>
                        </div>
                        <div class="layui-col-xs3">
                            <button class="layui-btn layui-btn-ext1 download-btn-ext1 fr mr10"></button>
                        </div>
                    </div>
                    <div class="layui-col-xs12 height-44 bg-cor-blue1 flex flex-ac mb8">
                        <div class="layui-col-xs9">
                            <div class="f-peo-ext1 flex flex-ac ml10">
                                <div class="f-peo-ext1-i">
                                    <div class="f-peo-ext1-it1">
                                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-upload-files-p2.png">
                                    </div>
                                </div>
                                <p class="font-size-13 cor-4d ml15">2.相关附件列表.xls</p>
                            </div>
                        </div>
                        <div class="layui-col-xs3">
                            <button class="layui-btn layui-btn-ext1 download-btn-ext1 fr mr10"></button>
                        </div>
                    </div>
                    <div class="layui-col-xs12 height-44 bg-cor-blue1 flex flex-ac mb8">
                        <div class="layui-col-xs9">
                            <div class="f-peo-ext1 flex flex-ac ml10">
                                <div class="f-peo-ext1-i">
                                    <div class="f-peo-ext1-it1">
                                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-upload-files-p3.png">
                                    </div>
                                </div>
                                <p class="font-size-13 cor-4d ml15">3.相关附件内容.pdf</p>
                            </div>
                        </div>
                        <div class="layui-col-xs3">
                            <button class="layui-btn layui-btn-ext1 download-btn-ext1 fr mr10"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-row posi-fixed posi-left-0 posi-right-0 posi-bottom-0 pt10 pl15 pr15 pb10 bg-fff bor-top-f0 j-calc-btm">
            <div class="layui-col-xs12 flex">
                <input type="text" placeholder="说点什么吧" class="layui-input font-size-12 height-29 border-radius-15 bg-cor-f0 bg-unset input-pla-999 pl15">
                <ul class="flex flex-ac">
                    <li>
                        <!-- 图标选中状态 加 layui-this -->
                        <button class="layui-btn layui-btn-ext1 j-to-msg posi-rela fr ml15"><i class="notice-tools-i1 layui-this"></i><em class="count-tips-ext2">8</em></button>
                    </li>
                    <li>
                        <!-- 图标选中状态 加 layui-this -->
                        <button class="layui-btn layui-btn-ext1 fr ml15"><i class="notice-tools-i2"></i></button>
                    </li>
                    <li>
                        <!-- 图标选中状态 加 layui-this -->
                        <button class="layui-btn layui-btn-ext1 fr ml15"><i class="notice-tools-i3"></i></button>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 全屏弹窗需要盖住顶部按钮需要调整弹窗层级，加类zindex-50 -->
        <div class="layui-row layer-bd zindex-50 hide">
            <div class="layer-bd-cont layer-cont-ext1 height-p100 bg-fff hide">
                <div class="layui-row pt15 pb15">
                    <div class="bor-btm-f0 pl25 pr15 flex">
                        <div class="layui-col-xs12 flex flex-jb flex-ac pb10">
                            <p class="font-size-17 cor-333 text-align-c flex1">全部评论</p>
                            <button class="layui-btn layui-btn-ext1"><i class="layui-icon layui-icon-close j-close-layer btn-bg-ext1 font-size-12 cor-b3 pl5 pr5"></i></button>
                        </div>
                    </div>
                    <div class="layui-col-xs12 pl25 pr15 mt12 flex flex-jb flex-ac">
                        <p class="font-size-15 cor-4d">评论<em class="cor-red4">(20)</em></p>
                        <ul class="notice-tabs1 flex">
                            <li class="flex flex-ac">
                                <button class="layui-btn layui-btn-ext1 notice-tabs1-item notice-tabs1-item1 layui-this">默认</button>
                            </li>
                            <li class="flex flex-ac">
                                <button class="layui-btn layui-btn-ext1 notice-tabs1-item notice-tabs1-item2">最新</button>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="layui-row layer-bd-item notice-h1 pl15 pr15">
                    <!-- 回复搂主 1楼 -->
                    <div class="layui-col-xs12 flex bor-btm-f0 pb10 mt15">
                        <span class="photo-ext1">
                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-photo-ext1.png">
                        </span>
                        <div class="flex1 ml15">
                            <p class="font-size-14 cor-4d">李**哲</p>
                            <p class="font-size-12 cor-666 mt4">评论评论评论评论评论评论评论评论评论评论评论评评论评论评</p>
                            <div class="flex flex-ac flex-jb mt10">
                                <p class="font-size-12 cor-b3">2018.09.27<em class="ml15">10:18</em> </p>
                                <ul class="flex flex-ac">
                                    <li>
                                        <button class="layui-btn layui-btn-ext1 fr ml15"><i class="btn-msg-i1"></i></button>
                                    </li>
                                    <li>
                                        <!-- 图标选中状态 加 layui-this -->
                                        <button class="layui-btn layui-btn-ext1 fr ml15"><i class="btn-msg-i2 layui-this"></i></button>
                                    </li>
                                </ul>
                            </div>

                            <!-- 回复层主 -->
                            <div class="layui-col-xs12">
                                <!-- 回复层主1 -->
                                <div class="layui-col-xs12 flex mt12">
                                    <span class="photo-ext1">
                                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-photo-ext2.png">
                                    </span>
                                    <div class="flex1 ml15">
                                        <p class="font-size-14 cor-4d">马**语</p>
                                        <p class="font-size-12 cor-666 mt4">评论评论评论评论评论评论评论评论评论评论评论评评论评论评</p>
                                        <div class="flex flex-ac flex-jb mt10">
                                            <p class="font-size-12 cor-b3">2018.09.27<em class="ml15">10:18</em> </p>
                                            <ul class="flex flex-ac">
                                                <li>
                                                    <button class="layui-btn layui-btn-ext1 fr ml15"><i class="btn-msg-i1"></i></button>
                                                </li>
                                                <li>
                                                    <!-- 图标选中状态 加 layui-this -->
                                                    <button class="layui-btn layui-btn-ext1 fr ml15"><i class="btn-msg-i2 layui-this"></i></button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <!-- 回复层主2 -->
                                <div class="layui-col-xs12 flex mt12">
                                    <span class="photo-ext1">
                                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-photo-ext2.png">
                                    </span>
                                    <div class="flex1 ml15">
                                        <p class="font-size-14 cor-4d">刘**梦<em class="cor-80 ml10 mr10">回复</em>马**语</p>
                                        <p class="font-size-12 cor-666 mt4">评论评论评论评论评论评论评论评论评论评论评论评评论评论评</p>
                                        <div class="flex flex-ac flex-jb mt10">
                                            <p class="font-size-12 cor-b3">2018.09.27<em class="ml15">10:18</em> </p>
                                            <ul class="flex flex-ac">
                                                <li>
                                                    <button class="layui-btn layui-btn-ext1 fr ml15"><i class="btn-msg-i1"></i></button>
                                                </li>
                                                <li>
                                                    <!-- 图标选中状态 加 layui-this -->
                                                    <button class="layui-btn layui-btn-ext1 fr ml15"><i class="btn-msg-i2 layui-this"></i></button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <!-- 回复层主3 -->
                                <div class="layui-col-xs12 flex mt12">
                                    <span class="photo-ext1">
                                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-photo-ext2.png">
                                    </span>
                                    <div class="flex1 ml15">
                                        <p class="font-size-14 cor-4d">李**哲</p>
                                        <p class="font-size-12 cor-666 mt4">评论评论评论评论评论评论评论评论评论评论评论评评论评论评</p>
                                        <div class="flex flex-ac flex-jb mt10">
                                            <p class="font-size-12 cor-b3">2018.09.27<em class="ml15">10:18</em> </p>
                                            <ul class="flex flex-ac">
                                                <li>
                                                    <button class="layui-btn layui-btn-ext1 fr ml15"><i class="btn-msg-i1"></i></button>
                                                </li>
                                                <li>
                                                    <!-- 图标选中状态 加 layui-this -->
                                                    <button class="layui-btn layui-btn-ext1 fr ml15"><i class="btn-msg-i2 layui-this"></i></button>
                                                </li>
                                            </ul>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- 回复搂主 2楼 -->
                    <div class="layui-col-xs12 flex bor-btm-f0 pb10 mt15">
                        <span class="photo-ext1">
                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-photo-ext1.png">
                        </span>
                        <div class="flex1 ml15">
                            <p class="font-size-14 cor-4d">李**哲</p>
                            <p class="font-size-12 cor-666 mt4">评论评论评论评论评论评论评论评论评论评论评论评评论评论评</p>
                            <div class="flex flex-ac flex-jb mt10">
                                <p class="font-size-12 cor-b3">2018.09.27<em class="ml15">10:18</em> </p>
                                <ul class="flex flex-ac">
                                    <li>
                                        <button class="layui-btn layui-btn-ext1 fr ml15"><i class="btn-msg-i1"></i></button>
                                    </li>
                                    <li>
                                        <!-- 图标选中状态 加 layui-this -->
                                        <button class="layui-btn layui-btn-ext1 fr ml15"><i class="btn-msg-i2 layui-this"></i></button>
                                    </li>
                                </ul>
                            </div>

                            <!-- 回复层主 -->
                            <div class="layui-col-xs12">
                                <!-- 回复层主1 -->
                                <div class="layui-col-xs12 flex mt12">
                                    <span class="photo-ext1">
                                        <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-photo-ext2.png">
                                    </span>
                                    <div class="flex1 ml15">
                                        <p class="font-size-14 cor-4d">马**语</p>
                                        <p class="font-size-12 cor-666 mt4">评论评论评论评论评论评论评论评论评论评论评论评评论评论评</p>
                                        <div class="flex flex-ac flex-jb mt10">
                                            <p class="font-size-12 cor-b3">2018.09.27<em class="ml15">10:18</em> </p>
                                            <ul class="flex flex-ac">
                                                <li>
                                                    <button class="layui-btn layui-btn-ext1 fr ml15"><i class="btn-msg-i1"></i></button>
                                                </li>
                                                <li>
                                                    <!-- 图标选中状态 加 layui-this -->
                                                    <button class="layui-btn layui-btn-ext1 fr ml15"><i class="btn-msg-i2 layui-this"></i></button>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 回复搂主 3楼 -->
                    <div class="layui-col-xs12 flex bor-btm-f0 pb10 mt15">
                        <span class="photo-ext1">
                            <img src="${uiDomain}/app-assets/_jzfp/fujian-xczx/images/icon/icon-photo-ext1.png">
                        </span>
                        <div class="flex1 ml15">
                            <p class="font-size-14 cor-4d">李**哲</p>
                            <p class="font-size-12 cor-666 mt4">评论评论评论评论评论评论评论评论评论评论评论评评论评论评</p>
                            <div class="flex flex-ac flex-jb mt10">
                                <p class="font-size-12 cor-b3">2018.09.27<em class="ml15">10:18</em> </p>
                                <ul class="flex flex-ac">
                                    <li>
                                        <button class="layui-btn layui-btn-ext1 fr ml15"><i class="btn-msg-i1"></i></button>
                                    </li>
                                    <li>
                                        <!-- 图标选中状态 加 layui-this -->
                                        <button class="layui-btn layui-btn-ext1 fr ml15"><i class="btn-msg-i2 layui-this"></i></button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!--代码结束-->
</body>
<script src="${uiDomain}/web-assets/common/js/jqry-9-1-12-4.min.js"></script>
<script src="${uiDomain}/app-assets/plugins/swiper-4.1.6/dist/js/swiper.min.js"></script>
<script>
    $.fn.extend({
        msgC: function () {
            var _this = this;
            // 评论弹窗
            $(_this).on('click', function () {
                if ($(this).hasClass('layui-this')) {
                    _this.closeLI();
                } else {
                    $('.layer-bd').removeClass('hide');
                    $('.layer-bd-cont').slideDown(300);
                    var thisindex = $(this).attr('data-navindex');
                    $('.btn-tabs-ext1>div').eq(thisindex).children().addClass('layui-this').parent().siblings().children().removeClass('layui-this');
                    $(this).addClass('layui-this');
                }

            });
        },
        closeL: function () {
            var _this = this;
            $(_this).on('click', function () {
                _this.closeLI();
            });
        },
        closeLI: function () {
            $('.layer-bd-cont').slideUp(300).siblings().fadeOut(300)
            setTimeout(function () {
                $('.layer-bd').addClass('hide');
                $('.j-to-msg').removeClass('layui-this');
            }, 300);
        },
        layerCalc: function () {
            var _this = this;
            var btmBarH = $('.j-calc-btm').outerHeight();
            $(_this).css({ 'bottom': btmBarH + 'px' });
        },
        tabsExt1: function () {
            var _this = this;
            $(_this).on('click', '.notice-tabs1-item', function () {
                $(this).addClass('layui-this').parent().siblings().children().removeClass('layui-this');
            });
        }

    });
    $(function () {
        // 菜单下拉
        $('.j-to-msg').msgC();

        // 关闭弹窗
        $('.j-close-layer').closeL();

        // 计算弹窗高度
        $('.layer-bd').layerCalc();

        // 评论排序
        $('.notice-tabs1').tabsExt1();


        var swiperList1 = new Swiper('.swiper-list-ext1', {
            slidesPerView: 3.5,
            spaceBetween: 10,
        });
    });
</script>

</html>