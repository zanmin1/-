<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>语音播报</title>
    <!-- layui样式 -->
    <#include "/component/layuiCommonHeadHttps.ftl" />
    <#include "/component/ComboBoxHttps.ftl" />
    <!--本模块仅限https 及现网环境下使用 -->
    <style>

        .but-dis {
            cursor: not-allowed !important;
        }

        .yybb-s-del > i {
            width: 18px !important;
            height: 18px !important;
        }
    </style>


</head>
<body class="ovh">


<div class="bs h100 pl10 pr10 pb10 pt10 layui-form">


    <div class="layer-box-bg-ext1 bs h100 posi-rela">
        <div class="yybb-content pt10 bs">
            <div class="pl20 pr20 scroll h100 bs">
                <div class="mt15 yybb-cm-time yybb-cm-bg">
                    <#--						<p class="font-size-36 text-align-c yybb-cmt-text cor-999"><em class="cor-407de7 mr15">00.00.00</em>/<i class="cor-666 ml15">00.00.00</i></p>-->
                    <p id="voice-label" class="font-size-36 text-align-c yybb-cmt-text cor-999">
                        <span id="textAudio" style="color: red;font-weight: bold">（录音功能正在准备中）</span></p>
                    <p id="lisening" class="font-size-36 text-align-c yybb-cmt-text cor-999  hide ">（点击开始说话）</p>
                </div>

                <div class="yybb-recording-btn mt15 text-align-c">
                    <button disabled="disabled" type="button" class=" but-dis layui-btn layui-btn-ext4 ksly"><i
                                class="recording-icon mr10"></i>开始录音
                    </button>
                    <button type="button" class="layui-btn layui-btn-ext4 tzly hide"><i class="recording-icon mr10"></i>停止录音
                    </button>
                </div>
                <!-- 选择音频文件 -->
                <div class="mt30 clearfix">
                    <div class="clearfix">
                        <p class="table-title-ext1 fl"><i class="text-icon-ext1"></i>查看音频文件</p>
<#--                        <div class="yybb-upload-btn fr">-->
<#--                            <button onclick="upVoiceA()" type="button" class="layui-btn layui-btn-normal xs-upload">-->
<#--                                上传音频-->
<#--                            </button>-->
<#--                        </div>-->
                    </div>
                    <div class="yybb-cm-bg mt10 yybb-show">
                        <!-- 无语音时展示,去掉类hide -->
                        <p class="yybb-show-text font-size-18 font-bold line-height-78 text-align-c cor-ccc">请先录制语音</p>
                        <!-- 有语音时展示 -->
                        <div class="yybb-show-content h100 flex flex-ac flex-jb bs pr20 hide">
                            <div style="width: 546px !important;height: 76px  !important;"
                                 class="ml20 fl  flex flex-ac pl10 pr15 bs">
                                <audio class=" flex1  text-line-c1 font-size-14 cor-666 LogAudioPlayer"
                                       style="width:100%" controls=""></audio>
                            </div>
<#--                            <div class="flex flex-ac pl20 pt25">-->
<#--                                <div onclick="delVoice()" class="yybb-s-del flex flex-ac ml30">-->
<#--                                    <i></i>-->
<#--                                    <p  class="cor-ff5c5c font-size-20">删除</p>-->
<#--                                </div>-->
<#--                            </div>-->
                        </div>
                    </div>
                </div>
                <div class=" LogAudioInfo ">
                </div>
                <!-- 即将发送的人员名单 -->
                <div class="  mt30">
                    <p class="font-size-14 cor-333 text-lh1">即将发送<span class="cor-666 font-size-12 ml10">至 <em
                                    id="count" class="cor-ff5c5c"></em> 人</span></p>
                    <p class="font-size-14 line-height-24 cor-999 text-line-c2 mt10" id="people"></p>
                </div>
            </div>
        </div>
        <div class="yybb-mask-bottom text-align-c">
            <button onclick="upVoiceA()" type="button" class="layui-btn layui-btn-normal xs-fsyx"><i
                        class="fsyy-icon mr10"></i>开始发送语音
            </button>
            <button onclick="downA()" type="button" class="layui-btn layui-btn-ext2 xs-save"><i
                        class="bcyy-icon mr10"></i>保存语音
            </button>
        </div>
    </div>
</div>
<script src="${rc.getContextPath()}/js/audio/recorder.js?v=2"></script>
<#--	<script src="${rc.getContextPath()}/js/audio/recorder.mp3.min.js?v=1"></script>-->

<script>

    var  linkMan = '${linkMan}'; //用户 linkman
    var  phone = '${phone}'; //用户电话 更改来电显示

    var rec; //录制插件对象
    var telList = null; //人员电话 逗号分隔
    var people = null; //人员名字 逗号分隔
    var objLength = null; //人员数量
    var peopleUUList = null; //人员uuid 逗号分隔
    var upStatus = null; //上传状态
    var blobAudio = null; //文件 blob 对象
    var url = null;  //文件路径
    var formData = null; //上传
    var filleName = null; //文件名
    var maxTime = 120000; //语音最大时间 ms

    $(function () {

        // 滚动条美化
        $('.scroll').niceScroll({
            cursorcolor: "#000", //滚动条的颜色
            cursoropacitymax: 0.12, //滚动条的透明度，从0-1
            cursorwidth: "4px", //滚动条的宽度  单位默认px
            cursorborderradius: "2px", //滚动条两头的圆角
            autohidemode: false, //是否隐藏滚动条  true的时候默认不显示滚动条，当鼠标经过的时候显示滚动条
            zindex: 8, //给滚动条设置z-index值
        })

        layui.use(['form', 'table', 'laydate', 'laytpl', 'element', 'layer'], function () {
            var form = layui.form,
                table = layui.table,
                laydate = layui.laydate,
                laytpl = layui.laytpl,
                element = layui.element,
                layer = layui.layer;

            var bo = '${bo}';

            var obj = JSON.parse(bo);

            $("#count").html(obj.length);

            peopleUUList = '';

            people = "";

            telList = "";

            objLength = obj.length;

            $.each(obj, function (i, val) {
                peopleUUList += val.uuid + ",";
                people += val.name + "、"
                telList += val.tel + ","
            })

            peopleUUList = peopleUUList.substr(0, peopleUUList.length - 1);
            telList = telList.substr(0, telList.length - 1);
            people = people.substr(0, people.length - 1);

            $("#people").html(people);

            // 开始按钮
            $('.ksly').click(function () {
                delVoice();

                $('.ksly').hide();
                $('.tzly').show();
                recStart();

            })

            // 停止按钮
            $('.tzly').click(function () {
                $('.tzly').hide();
                $('.ksly').show();
                recStop();
            })
            // open 录制
            init();
        })
    })
</script>

<script>

    /**调用open打开录音请求好录音权限**/
    function init() {//一般在显示出录音按钮或相关的录音界面时进行此方法调用，后面用户点击开始录音时就能畅通无阻了

        // rec=Recorder({
        // 	type:"mp3",sampleRate:8000,bitRate:16 ,numChannels:2
        // 	,onProcess:function(buffers,powerLevel,duration,sampleRate,newBufferIdx,asyncEnd){
        //
        // 		$("#lisening").html('<p class="font-size-36 text-align-c yybb-cmt-text cor-999"><em class="cor-407de7 mr15">'+formatMs(duration,1)+'</em>/<i class="cor-666 ml15">'+powerLevel+'</i></p>');
        //
        // 	}
        // });
        //
        // var t=setTimeout(function(){
        //
        // 	$("#textAudio").html("加载录音失败")
        //
        // },8000);
        //
        // rec.open(function(){
        // 	clearTimeout(t);
        // 	//显示开始说话
        // 	$("#lisening").show();
        // 	$("#voice-label").hide();
        //
        // 	//开启按钮
        // 	$('.ksly').removeAttr("disabled");
        // 	$(".ksly").removeClass("but-dis")
        //
        // 	//rec.start() 此处可以立即开始录音，但不建议这样编写，因为open是一个延迟漫长的操作，通过两次用户操作来分别调用open和start是推荐的最佳流程
        // },function(msg,isUserNotAllow){//用户拒绝未授权或不支持
        // 	$("#textAudio").html("录音功能加载失败")
        // 	clearTimeout(t);
        // //	Runtime.Log((isUserNotAllow?"UserNotAllow，":"")+"无法录音:"+msg, 1);
        // });

        rec = new Recorder({
            sampleBits: 16,                 // 采样位数，支持 8 或 16，默认是16
            sampleRate: 8000,              // 采样率，支持 11025、16000、22050、24000、44100、48000，根据浏览器默认值，我的chrome是48000
            numChannels: 2,                 // 声道，支持 1 或 2， 默认是1
        });


        //判断权限
        Recorder.getPermission().then(() => {
            $("#lisening").show();
            $("#voice-label").hide();

            //开启按钮
            $('.ksly').removeAttr("disabled");
            $(".ksly").removeClass("but-dis")
        }, (error) => {
            $("#textAudio").html("录音功能加载失败")
        });

        //录制过程回调
        rec.onprogress = function (params) {

            $("#lisening").html('<p class="font-size-36 text-align-c yybb-cmt-text cor-999"><em class="cor-407de7 mr15">时间:' + formatMs((params.duration * 1000), 1) + '</em>/<i class="cor-666 ml15">音量:' + Math.round(params.vol) + "%" + '</i></p>');

        }
    };

    /**开始录音**/
    function recStart() {

        rec.start().then(() => {
            // 开始录音
        }, (error) => {
            // 出错了
            $("#textAudio").html("录音功能加载失败")
        });

        //	rec.start();
    };

    //返回录制时间 判断最大时间
    var formatMs = function (ms, all) {

        //到达最大时间时强制停止
        if (ms >= maxTime) {
            recStop();
        }

        var f = Math.floor(ms / 60000), m = Math.floor(ms / 1000) % 60;

        var s = (all || f > 0 ? (f < 10 ? "0" : "") + f + ":" : "")
            + (all || f > 0 || m > 0 ? ("0" + m).substr(-2) + "″" : "")
            + ("00" + ms % 1000).substr(-3);
        return s;
    };


    /**结束录音**/
    function recStop() {

        formData = new FormData();

        blobAudio = rec.getWAVBlob();

        filleName = rondomNum(true, 16, 16);//取十六位随机数 作为文件名

        formData.append("upfile", blobAudio, filleName + ".wav");

        //重新
        $(".ksly").html('<i class="recording-icon mr10"></i>重新录制');

        play(blobAudio);


        // rec.stop(function(blob,duration){
        //
        // 	formData= new FormData();
        //
        // 	blobAudio =blob;
        //
        // 	filleName = rondomNum(true, 16, 16);//取十四位随机数 作为文件名
        //
        // 	formData.append("upfile",blob,filleName+".mp3");
        //
        // 	var set=rec&&rec.set||{};
        // 	set=	$.extend({},set);
        //
        // 	//准备播放
        // 	play(blob,set);
        // })
    };

    //随机文件名字
    function rondomNum(randomFlag, min, max) {
        var str = "",
            range = min,
            arr = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'U', 'V', 'W', 'X', 'Y', 'Z'];
        // 随机产生
        if (randomFlag) {
            range = Math.round(Math.random() * (max - min)) + min;
        }
        for (var i = 0; i < range; i++) {
            pos = Math.round(Math.random() * (arr.length - 1));
            str += arr[pos];
        }
        return str;
    }

    //播放预备
    function play(blob) {
        var audio = $(".LogAudioPlayer")[0];
        audio.controls = true;
        if (!(audio.ended || audio.paused)) {
            audio.pause();
        }
        ;

        audio.onerror = function (e) {
            $(".yybb-show-text").show();
            $(".yybb-show-content").hide();
            $(".yybb-show-text").html("语音转码失败");
        };

        var end = function (blob) {
            audio.src = (window.URL || webkitURL).createObjectURL(blob);

            //可以开始播放
            $(".yybb-show-text").hide();
            $(".yybb-show-content").show();

            //	audio.play();
        };

        //	var wav=Recorder[set.type+"2wav"];
        var wav = blob;

        if (wav) {
            end(blob);
        } else {
            $(".yybb-show-text").show();
            $(".yybb-show-content").hide();
            $(".yybb-show-text").html("语音转码失败");

        }
        ;

    }

    //删除音频
    function delVoice() {

        $("#lisening").html('<p class="font-size-36 text-align-c yybb-cmt-text cor-999"><em class="cor-407de7 mr15">时间:00:00″000</em>/<i class="cor-666 ml15">音量:0%</i></p>');

        blobAudio = null;
        filleName = null;
        upStatus = null;

        $(".yybb-show-text").show();
        $(".yybb-show-content").hide();
        $(".yybb-show-text").html("请先录制语音");

    }

    //上传音频 使用 servletupload
    function upVoiceA() {

        if (blobAudio == null) {
            layer.msg("请先录制语音!", {skin: 'layui-layer-hui'});
            return;
        } else if (upStatus != null) {
            layer.msg("音频已上传!", {skin: 'layui-layer-hui'});
            return;
        }

        var submitLoad = layer.load(1);//打开遮罩

        $.ajax({
            url: '${rc.getContextPath()}/dcl/upLoadFile4x.jhtml',
            type: 'POST',
            cache: false,
            processData: false,
            contentType: false,
            data: formData,
            success: function (data) {

                var res = JSON.parse(data);

                if (res.error == 0) {
                    url = res.url;  //保存返回路径;
                    //防止重复上传
                    upStatus = "yes";
                    //上传完成发送
                    sendA();

                } else {
                    var opts = {
                        msg1: "上传失败",
                        icon: 3,
                        btn: []
                    };
                    parent.commonShowDialog(opts);
                    layer.close(submitLoad);
                }

            },
            error: function (data) {
                var opts = {
                    msg1: "连接超时",
                    icon: 4,
                    btn: []
                };
                parent.commonShowDialog(opts);
                layer.close(submitLoad);
            },
            complete: function () {
            }
        })


    }


    //调用发送接口
    function sendA() {

        if (url == null || url == '') {
            layer.msg("请先上传录音!", {skin: 'layui-layer-hui'});
            return;
        }

        var submitLoad = layer.load(1);//打开遮罩

        var params = {
            audioUrl: encodeURI(url),
            tel: telList,
            type: "VOX",
            message: null,
            phone:phone
        }
        $.ajax({
            type: 'POST',
            url: "${rc.getContextPath()}/dcl/SMSController/getPzListData.json?jsoncallback=?",
            data: params,
            dataType: 'jsonp',
            success: function (data) {

                //console.log(data);

                if (data.result == "success") {

                    $.ajax({
                        type: 'POST',
                        url: '${rc.getContextPath()}/dcl/historyBroadcastpush/save.json',
                        data: {
                            url: url,
                            recipient: people,
                            sendpeople: "${userName}",
                            reciveType: "0/"+objLength,
                            peopleIds: peopleUUList,
                            linkMan:linkMan,
                            sessionId:data.sessionId,
                            failNum:data.faliTel
                        },
                        dataType: 'json',
                        success: function (data) {

                            var opts = {
                                msg1: "发送成功",
                                icon: 2,
                                btn: []
                            };
                            //rec.close();
                            layer.close(submitLoad);
                            var index1 = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                            parent.layer.close(index1); //再执行关闭
                            parent.commonShowDialog(opts);
                        },
                        error: function (data) {
                            var opts = {
                                msg1: "连接超时",
                                icon: 4,
                                btn: []
                            };
                            parent.commonShowDialog(opts);
                            layer.close(submitLoad);
                        },
                        complete: function () {
                            layer.close(submitLoad);
                        }
                    });

                } else {
                    var opts = {
                        msg1: "发送失败",
                        icon: 3,
                        btn: []
                    };
                    parent.commonShowDialog(opts);
                    layer.close(submitLoad);

                }
            },
            error: function (data) {
                var opts = {
                    msg1: "连接超时",
                    icon: 4,
                    btn: []
                };
                parent.commonShowDialog(opts);
                layer.close(submitLoad);
            },
            complete: function () {
            }
        });
    }

    //音频下载
    function downA() {

        if(blobAudio==null||filleName==null){
        	layer.msg("请先录制语音!",{skin:'layui-layer-hui'});
        	return;
        }

        rec.downloadWAV("录音 " + filleName);

        // var submitLoad = layer.load(1);//打开遮罩
        //
        // var name="录音 "+filleName ;
        //
        // var downA=document.createElement("A");
        // downA.href=(window.URL||webkitURL).createObjectURL(blobAudio);
        // downA.download=name;
        // $(".LogAudioInfo").prepend(downA);
        // downA.click();
        // layer.close(submitLoad);

    }
</script>


</body>
</html>