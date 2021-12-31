<script>
    var MAP_BTN_ICON = {
        '已案释法': 'more-yasf.png',
        '普法教育': 'more-pfjy.png',
        '法律问答': 'more-flwd.png',
        '公证服务': 'more-gzfw.png',
        '村容村貌': 'more-crcm.png',
        '乡村旅游': 'more-xcly.png',
        '一村一品': 'more-ycyp.png',
        '资产管理': 'more-zcgl.png',
        '资金管理': 'more-zjgl.png',
        '资源管理': 'more-zygl.png',
        '合同管理': 'more-htgl.png',
        '事件上报': 'more-sjsb.png',
        '网格人员': 'more-wgry.png',
        '积分规则': 'more-jfgz.png',
        '乡村活动': 'more-xchd.png',
        '随手拍': 'more-ssp.png',
        '志愿者活动': 'more-zyzhd.png',
        '积分商城': 'more-jfsc.png',
        '积分兑换': 'more-jfdh.png',
        '积分台账': 'more-jftz.png',
        '办事指南': 'more-bszn.png',
        '便民查询': 'more-bmfw.png',
        '农业百科': 'more-nybk.png',
        '需求大厅': 'more-xqdt.png',
        '就业培训': 'more-jypx.png',
        '农技专家': 'more-njzj.png',
        '民情诉说': 'more-mqss.png',
    };

    function loadMoreBtn() {
        $.ajax({
            type: 'POST',
            url: '${rc.getContextPath()}/dcl/ruralLaw/getMoreBtn.json',
            data: {
                privilegeCode: "${privilegeCode!''}",
            },
            dataType: 'json',
            success: function (data) {
                if ($('.szsh-more.posi-abso').length > 0) {
                    $('body').find('.szsh-more.posi-abso').remove();
                }
                if (data && data.length > 0) {
                    $('body').append(
                        '<div class="szsh-more posi-abso">' +
                        '     <div class="szsh-m-box hide">' +
                        '        <div class="w100 h100  flex flex-ac flex-jc">' +
                        '            <p class="szsh-mb-text">更多<br>功能</p>' +
                        '        </div>' +
                        '    </div>' +
                        '    <div class="szsh-mb-content posi-abso bs">' +
                        '        <div class="szsh-mbc-title">' +
                        '            <p>更多功能</p>' +
                        '        </div>' +
                        '        <div class="szsh-mbc-content flex flex-clm" id="moreBtnList"></div>' +
                        '        <a href="javascript:void(0);" class="flex flex-ac szsh-more-closed flex-jc">' +
                        '            <p>收起</p>' +
                        '            <i></i>' +
                        '        </a>' +
                        '    </div>' +
                        '</div>'
                    );
                    for (var i = 0; i < data.length; i++) {
                        var btnName = data[i].actionName;
                        var img = MAP_BTN_ICON[btnName] == undefined ? 'more-bmfw.png' : MAP_BTN_ICON[btnName];
                        $('#moreBtnList').append(
                            '<div class="szsh-mbcc-item flex flex-clm flex-ac flex-jc" onclick="openUamWindow(\'' + data[i].privilegeId + '\')">' +
                            '    <div class="szsh-mbcci-icon">' +
                            '        <img src="${uiDomain}/web-assets/_big-screen/00-shuzishenghuo/images/subject/comm/' + img + '">' +
                            '    </div>' +
                            '    <p class="szsh-mbcci-text">' + btnName + '</p>' +
                            '</div>'
                        );
                    }

                    // 更多功能点击事件
                    $('.szsh-mbc-content').on('click', '.szsh-mbcc-item', function () {
                        $(this).addClass('active').siblings().removeClass('active');
                    });
                    // 更多功能收起和展开事件
                    $('.szsh-more-closed').click(function () {
                        $(this).parents('.szsh-mb-content').animate({right: "-1.14rem"}, 'linear', function () {
                            $('.szsh-m-box').removeClass('hide');
                        });
                    });
                    $('.szsh-m-box').click(function () {
                        $('.szsh-m-box').addClass('hide');
                        $(this).siblings('.szsh-mb-content').animate({right: ".1rem"}, 'linear');
                    });
                }
            },
        });
    }

    function openUamWindow(id) {
        window.open('${UAM_DOMAIN!''}/admin/szxc_sub?system_privilege_action=' + id);
    }

    loadMoreBtn();
</script>