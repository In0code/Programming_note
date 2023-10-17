<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="공통디자인을 사용하는 jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/jsp/cdn.jsp"></jsp:include>

<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
   
});//ready
</script>

</head>
<body>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="//www.w3.org/1999/xhtml" xml:lang="ko" lang="ko"><head><script>(function(i, s, o, g, r) {
    var a = s.createElement(o);
    var m = s.getElementsByTagName(o)[0];
    a.src = g;
    a.onload = function() {
        if (i[r].init) {
            i[r].init('https://js-error-tracer-api.cafe24.com', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhZnRlcmJsb3cuY2FmZTI0LmNvbSIsImF1ZCI6ImpzLWVycm9yLXRyYWNlci1hcGkuY2FmZTI0LmNvbSIsIm1hbGxfaWQiOiJhZnRlcmJsb3ciLCJzaG9wX25vIjoxLCJwYXRoX3JvbGUiOiJNWVNIT1BfV0lTSExJU1QiLCJsYW5ndWFnZV9jb2RlIjoia29fS1IiLCJjb3VudHJ5X2NvZGUiOiJLUiIsIm9yaWdpbiI6Imh0dHBzOlwvXC9hZnRlcmJsb3ctc2NlbnQuY29tIiwiaXNfY29udGFpbmVyIjpmYWxzZSwiaG9zdG5hbWUiOiJ1ZTExNTEifQ.n-TDv8j14D9uG0pJGefkjAclGNRnBHdm0G1bkWUBQLM', {"errors":{"path":"\/api\/v1\/store","collectWindowErrors":true,"preventDuplicateReports":true,"storageKeyPrefix":"EC_JET.MYSHOP_WISHLIST","samplingEnabled":true,"samplingRate":0.5},"vitals":{"path":"\/api\/v1\/vitals","samplingEnabled":true,"samplingRate":0.1},"resources":{"path":"\/api\/v1\/resources","samplingEnabled":true,"samplingRate":0.5,"durationThreshold":2000}});
        }
    };
    m.parentNode.insertBefore(a, m);
}(window, document, 'script', '//optimizer.poxo.com/jet/jet.js', 'EC_JET'));</script>
<script type="text/javascript">window.CAFE24 = window.CAFE24 || {};CAFE24.ROUTE = {"is_mobile":false,"is_need_route":false,"language_code":"ZZ","path":{"origin":"\/myshop\/wish_list.html","result":"\/myshop\/wish_list.html","prefix":""},"shop_no":0,"skin_code":"default","support_language_list":{"ar":"ar_EG","ar-EG":"ar_EG","de":"de_DE","de-DE":"de_DE","en":"en_US","en-IN":"en_IN","en-PH":"en_PH","en-US":"en_US","es":"es_ES","es-ES":"es_ES","hi":"hi_IN","hi-IN":"hi_IN","id":"id_ID","id-ID":"id_ID","it":"it_IT","it-IT":"it_IT","ja":"ja_JP","ja-JP":"ja_JP","ko":"ko_KR","ko-KR":"ko_KR","ms":"ms_MY","ms-MY":"ms_MY","pt":"pt_PT","pt-PT":"pt_PT","ru":"ru_RU","ru-RU":"ru_RU","th":"th_TH","th-TH":"th_TH","tr":"tr_TR","tr-TR":"tr_TR","vi":"vi_VN","vi-VN":"vi_VN","zh":"zh_CN","zh-CN":"zh_CN","zh-HK":"zh_HK","zh-MO":"zh_MO","zh-SG":"zh_SG","zh-TW":"zh_TW"}};</script></script><script type="text/javascript">if (typeof EC_ROUTE === "undefined") {
    /**
     * 프론트용 라우트 플러그인
     * @type {{bInit: boolean, init: EC_ROUTE.init}}
     * CAFE24.ROUTE 참조
     */
    var EC_ROUTE = {
        EC_DOMAIN_PATH_INFO: 'EC_DOMAIN_PATH_INFO',
        bInit: false,
        aFromList: [],
        aToList: [],
        aCleanFilter: null,
        init: function () {
            if (this.bInit || typeof CAFE24.ROUTE === 'undefined') {
                return;
            }
            this.bInit = true;
            this.aCleanFilter = [
                /^shop[1-9][0-9]*$/,
                /^(m|p)$/,
                new RegExp('^(' + Object.keys(CAFE24.ROUTE.support_language_list).join('|')  + ')$'),
                /^skin-(base|skin[1-9][0-9]*|mobile[0-9]*)$/,
            ];
        },
        isNeedRoute: function ()
        {
            return CAFE24.ROUTE.is_need_route;
        },
        /**
         *
         * @param iShopNo
         * @param bMobile
         * @param sFrontLanguage
         * @param sSkinCode
         * @returns {*|string}
         */
        getUrlDomain: function (iShopNo, bMobile, sFrontLanguage, sSkinCode)
        {
            var oRouteConfig = {};
            if (typeof iShopNo == 'undefined') {
                oRouteConfig.shop_no = CAFE24.SDE_SHOP_NUM;
            } else {
                oRouteConfig.shop_no = iShopNo;
            }
            if (typeof bMobile == 'undefined') {
                oRouteConfig.is_mobile = false;
            } else {
                oRouteConfig.is_mobile = bMobile;
            }
            if (typeof sFrontLanguage == 'undefined') {
                oRouteConfig.language_code = '';
            }else {
                oRouteConfig.language_code = sFrontLanguage; // 내부에서 로직으로 동작할땐 언어_지역 형태의 로케일 형태를 따른다.
            }
            if (typeof sSkinCode == 'undefined') {
                oRouteConfig.skin_code = '';
            }else {
                oRouteConfig.skin_code = sSkinCode;
            }

            var sDomain = '';
            if (oRouteConfig.shop_no != CAFE24.SDE_SHOP_NUM) {
                // 접근된 다른 멀티샵 도메인 정보는 primary domain 를 조회해야함으로 ajax 를 통해 정보를 얻는다.
                sDomain = this._getUrlDomainMultishop(oRouteConfig);
            } else {
                // 샵이 동일할 경우에는 접근된 domain 에 path 정보만 정리하여 반환함.
                sDomain = this._getUrlDomain(oRouteConfig);
            }
            return sDomain;
        },
        _getUrlDomainMultishop: function (oRouteConfig)
        {
            var sDomain = '';
            EC$.ajax({
                type: 'GET',
                url: '/exec/front/Shop/Domain',
                data: {
                    '_shop_no' : oRouteConfig.shop_no,
                    'is_mobile' : oRouteConfig.is_mobile,
                    'language_code' : oRouteConfig.language_code,
                    'skin_code' : oRouteConfig.skin_code,
                },
                async: false,
                dataType: 'json',
                cache: true,
                success: function(oResult) {
                    switch (oResult.code) {
                        case '0000' :
                            sDomain = oResult.data;
                            break;
                        default :
                            break;
                    }
                    return false;
                }
            });
            return sDomain;
        },
        _getUrlDomain: function (oRouteConfig)
        {
            oRouteConfig.domain = this._getCreateHost(oRouteConfig);
            return location.protocol + '//' + oRouteConfig.domain + this._getCreateUri(oRouteConfig);
        },
        _getCreateHost : function (oRouteConfig)
        {
            var sHost = location.host;
            var aHost = sHost.split('.');
            if (this.isBaseDomain(sHost)) {
                if (aHost.length > 3) {
                    aHost[0] = '';
                }
            } else if (oRouteConfig.is_mobile) {
                if (this.isMobileDomain()) {
                    oRouteConfig.is_mobile = false;
                }
            }
            return aHost.filter(Boolean).join('.');
        },
        _getCreateUri: function (oRouteInfo)
        {
            var aUrl = [];
            if (this.isBaseDomain() && oRouteInfo.shop_no > 1) {
                aUrl.push('shop' + oRouteInfo.shop_no);
            }
            if (oRouteInfo.is_mobile) {
                aUrl.push('m');
            }
            if (oRouteInfo.language_code != 'ZZ' && oRouteInfo.language_code != '') {
                var iIndex = Object.values(CAFE24.ROUTE.support_language_list).indexOf(oRouteInfo.language_code);
                if (iIndex !== -1) {
                    aUrl.push(Object.keys(CAFE24.ROUTE.support_language_list)[iIndex]);
                }
            }
            if (this.isBaseDomain() && oRouteInfo.skin_code != 'default' && oRouteInfo.skin_code != '') {
                aUrl.push('skin-' + oRouteInfo.skin_code);
            }
            var sUrl= '/';
            if (aUrl.length > 0) {
                sUrl= '/' + aUrl.join('/');
                sUrl = this.rtrim(sUrl, '/');
            }
            return sUrl;
        },
        /**
         * en, en-US => en_US
         */
        convertValidLanguageCode: function (sUrlLanguageCode)
        {
            if (typeof CAFE24.ROUTE.support_language_list[sUrlLanguageCode] != 'undefined') {
                return CAFE24.ROUTE.support_language_list[sUrlLanguageCode];
            }
            return false;
        },
        isMobileDomain: function (sHost)
        {
            if (typeof sHost == 'undefined') {
                sHost = location.host;
            }
            var aMatched = sHost.match(/^(m|mobile|skin\-mobile|skin\-mobile[0-9]+[\-]{2}shop[0-9]+|skin\-mobile[0-9]+|mobile[\-]{2}shop[0-9]+)\./i);
            return aMatched != null;
        },
        isBaseDomain: function (sHost)
        {
            if (typeof sHost == 'undefined') {
                sHost = location.host;
            }
            return sHost.indexOf(CAFE24.GLOBAL_INFO.getRootDomain()) !== -1;
        },
        removePrefixUrl: function (sUrl)
        {
            if (this.isNeedRoute()) {
                sUrl = sUrl.replace(this.getPrefixUrl('/'), '/'); // 자동으로  prefix 붙은 영역을 제거해준다.
            }
            return sUrl;
        },
        getPrefixUrl: function (sUrl)
        {
            if (this.isNeedRoute() === false) {
                return sUrl;
            }
            if (sUrl.indexOf('/') !== 0) {
                return sUrl;
            }
            if (sUrl.match(/^\/{2,}/) !== null) {
                return sUrl;
            }

            var iCachedPosition = this.aFromList.indexOf(sUrl);
            if (iCachedPosition > -1) {
                return this.aToList[iCachedPosition];
            }

            var bTailSlash = (sCleanUrl !== '/' && sUrl.substr(-1) === '/');
            var sCleanUrl = this.getCleanUrl(sUrl);
            var aPrefixPart = CAFE24.ROUTE.path.prefix.split('/');
            var aUrlPart = sCleanUrl.split('/');
            var bMatched = true;
            var sReturnUrl = sCleanUrl;
            if (aUrlPart.length < aPrefixPart.length) {
                bMatched = false;
            } else {
                for (var i = 0; i < aPrefixPart.length ; i++) {
                    if (aPrefixPart[i] != aUrlPart[i]) {
                        bMatched = false;
                        break;
                    }
                }
            }
            if (bMatched === false) {
                if (sCleanUrl == '/') {
                    sReturnUrl = CAFE24.ROUTE.path.prefix;
                } else {
                    sReturnUrl = CAFE24.ROUTE.path.prefix +  sCleanUrl;
                }
                sReturnUrl = bTailSlash ? sReturnUrl : this.rtrim(sReturnUrl, '/')
                this.aFromList.push(sUrl);
                this.aToList.push(sReturnUrl);
            }
            return sReturnUrl;
        },
        /**
         * document.location.pathname 이 필요할 경우 사용한다.
         * @returns {*}
         */
        getPathName: function()
        {
            if (typeof CAFE24.ROUTE.path.result == 'undefined') {
                return document.location.pathname;
            }
            return CAFE24.ROUTE.path.result;
        },
        rtrim: function (str, chr)
        {
            var rgxtrim = (!chr) ? new RegExp('\\s+$') : new RegExp(chr+'+$');
            return str.replace(rgxtrim, '');
        },
        getShopNo: function ()
        {
            return CAFE24.ROUTE.shop_no;
        },
        getSkinCode: function ()
        {
            return CAFE24.ROUTE.skin_code;
        },
        getLanguageCode: function ()
        {
            return CAFE24.ROUTE.language_code;
        },
        getMobile: function ()
        {
            return CAFE24.ROUTE.is_mobile;
        },
        getIsMobile: function ()
        {
            return CAFE24.ROUTE.is_mobile || CAFE24.ROUTE.skin_code.match(/^mobile[0-9]*$/);
        },
        getCleanUrl: function (sUrl)
        {
            if (sUrl === '/') {
                return sUrl;
            }

            var aUrl = sUrl.split('/');
            aUrl.shift();

            if (aUrl.length < 1) {
                return sUrl;
            }

            // 현재 4 depth 까지 미리보기 기능이 구현되어있음
            var iPos = 0;
            var bFind = false;
            for (var i = 0; i < aUrl.length ; i++) {
                bFind = false;
                for (var iSub = iPos, iSubCount = this.aCleanFilter.length; iSub < iSubCount ; iSub++) {
                    if (aUrl[i].match(this.aCleanFilter[iSub]) !== null) {
                        bFind = true;
                        iPos = iSub + 1;
                        aUrl.splice(i, 1);
                        i--; // aUrl 을 삭제해 주었으니 검색 조건을 -1 제거하여 초기화 한다. 다음 for i++ 로 증감 조회됨.
                        break;
                    }
                }
                if (bFind === false) {
                    break;
                }
            }
            return '/' + aUrl.join('/');
        },
        getIsEasyUrl : function ()
        {
            return !window.location.pathname.match(/^[\w\/\-\.]+(php|html|htm)$/i);
        }
    };
    EC_ROUTE.init();
}
</script><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="X-UA-Compatible" content="IE=edge"/><meta http-equiv="Cache-Control" content="no-cache"/><meta http-equiv="Expires" content="0"/><meta http-equiv="Pragma" content="no-cache"/><script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.3.min.js"></script><link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Shippori+Mincho:wght@400;700&amp;display=swap" rel="stylesheet"/><!--[if lt IE 9]>
<script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<script src="https://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]--><script type="text/javascript" src="/web/upload/js/jquery.model.js"></script><script>
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) != -1) return c.substring(name.length,c.length);
    }
    return "";
} 
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
} 
</script><script>
function couponClose(){
    if($("input[name='chkbox']").is(":checked") ==true){
        setCookie("close","Y",1);
    }
    $("#popp27").fadeOut(200); 
}
$(document).ready(function(){
    cookiedata = document.cookie;
    if(cookiedata.indexOf("close=Y")<0){
        $("#popp27").show(); 
    }else{
        $("#popp27").hide(); 
    }
    $("#close").click(function(){
        couponClose();
    });
});
</script>
<meta name="naver-site-verification" content="594cd5ae3c1df02f243c3124f3d667ef66455c85" />
<meta name="facebook-domain-verification" content="d48c8a2oh8pf7r0getwbjaygzvh5ju" />
<meta name="google-site-verification" content="imHljx5A9HRsDDzPn2B7sEre0edIvPpOZBUKPGvbx40" />
<link rel="shortcut icon" href="http://afterblow.cafe24.com//web/upload/ico_site.png">

<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayers','GTM-T3T7VL8');</script>
<!-- End Google Tag Manager -->
<link rel="canonical" href="https://afterblow-scent.com/myshop/wish_list.html" />
<link rel="alternate" href="https://m.afterblow-scent.com/myshop/wish_list.html" />
<meta property="og:url" content="https://afterblow-scent.com/myshop/wish_list.html" />
<meta property="og:site_name" content="Afterblow" />
<meta property="og:type" content="website" />
<meta name="google-site-verification" content="5u30lbi9lsltQvOIJydZ5tEbnUQpWEAIHfNDSu2IdYc" />
<link rel="shortcut icon" href="/web/upload/favicon-15f8ff915af6f4d1483a4516e6a2e7ed.ico" />
<script type="text/javascript" src="/app/Eclog/js/cid.generate.js?vs=a696fdcecc81c80f9046d86c2d96bb37&u=afterblow.1"></script>
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">var CAFE24API = { instance : [], MALL_ID : 'afterblow', SHOP_NO : 1, init : function (appInfo) { if (typeof appInfo == 'object') { if (appInfo.hasOwnProperty('client_id')) { var appKey = appInfo.client_id; } } else { var appKey = appInfo; } if (appKey) { if (!this.instance[appKey]) { CAFE24API.clientId = appKey; if (appInfo.hasOwnProperty('version')) { CAFE24API.version = appInfo.version; } else { if (CAFE24API.hasOwnProperty('version')) { delete CAFE24API.version; } } var copyObject = CAFE24API.constructor(); for (var attr in CAFE24API) { if (CAFE24API.hasOwnProperty(attr)) { copyObject[attr] = CAFE24API[attr]; } } this.instance[appKey] = copyObject; } return this.instance[appKey]; } }, initializeXhr : function () { try { return new XMLHttpRequest(); } catch (error) { return new window.ActiveXObject('Microsoft.XMLHTTP'); } }, fullPath: function (url) { return 'https://afterblow.cafe24api.com' + url; }, getMemberID: function (callback) { if (!CAPP_ASYNC_METHODS.IS_LOGIN) { callback(null); } else { callback(CAPP_ASYNC_METHODS.AppCommon.getMemberID()); } }, getEncryptedMemberId: function (client_id, callback) { if (!CAFE24API.__chkValidSessionScope(callback, 'customer')) { return; } callback(null, CAPP_ASYNC_METHODS.AppCommon.getEncryptedMemberId(client_id)); }, getMemberInfo: function (callback) { callback({'id': CAPP_ASYNC_METHODS.AppCommon.getMemberInfo()}); }, getCustomerIDInfo: function (callback) { if (!CAFE24API.__scopeErr(callback, 'application')) { return; } callback(null, {'id': CAPP_ASYNC_METHODS.AppCommon.getCustomerIDInfo()}); }, getCustomerInfo: function (callback) { if (!CAFE24API.__chkValidSessionScope(callback, 'customer')) { return; } callback(null, {'customer': CAPP_ASYNC_METHODS.AppCommon.getCustomerInfo()}); }, getMileageInfo: function (callback) { if (!CAFE24API.__chkValidSessionScope(callback, 'customer')) { return; } callback(null, {'mileage': CAPP_ASYNC_METHODS.AppCommon.getMileageInfo()}); }, getPointInfo: function (callback) { if (!CAFE24API.__chkValidSessionScope(callback, 'customer')) { return; } callback(null, {'point': CAPP_ASYNC_METHODS.AppCommon.getPointInfo()}); }, getDepositInfo: function (callback) { if (!CAFE24API.__chkValidSessionScope(callback, 'customer')) { return; } callback(null, {'deposit': CAPP_ASYNC_METHODS.AppCommon.getDepositInfo()}); }, getCreditInfo: function (callback) { if (!CAFE24API.__chkValidSessionScope(callback, 'customer')) { return; } callback(null, {'credit': CAPP_ASYNC_METHODS.AppCommon.getCreditInfo()}); }, getCartList: function (callback) { if (!CAFE24API.__scopeErr(callback, 'personal')) { return; } CAPP_ASYNC_METHODS.AppCommon.getCartList().then(function(data){ callback(null, {'carts': data}); }); }, getCartInfo: function (callback) { if (!CAFE24API.__chkValidSessionScope(callback, 'personal')) { return; } callback(null, {'cart': CAPP_ASYNC_METHODS.AppCommon.getCartInfo()}); }, getCartItemList: function (callback) { if (!CAFE24API.__scopeErr(callback, 'order')) { return; } callback(null, {'items': CAPP_ASYNC_METHODS.AppCommon.getCartItemList()}); }, getCartCount: function (callback) { if (!CAFE24API.__chkValidSessionScope(callback, 'personal')) { return; } callback(null, CAPP_ASYNC_METHODS.AppCommon.getCartCount()); }, getCouponCount: function (callback) { if (!CAFE24API.__chkValidSessionScope(callback, 'promotion')) { return; } callback(null, CAPP_ASYNC_METHODS.AppCommon.getCouponCount()); }, getWishCount: function (callback) { if (!CAFE24API.__chkValidSessionScope(callback, 'personal')) { return; } callback(null, CAPP_ASYNC_METHODS.AppCommon.getWishCount()); }, getShopInfo: function (callback) { if (!CAFE24API.__scopeErr(callback, 'store')) { return; } callback(null, {'shop': CAPP_ASYNC_METHODS.AppCommon.getShopInfo()}); }, addCurrentProductToCart: function (mall_id, time, app_key, member_id, hmac, callback) { if (!CAFE24API.__scopeErr(callback, 'order')) { return; } CAPP_ASYNC_METHODS.AppCommon.addCurrentProductToCart(mall_id, time, app_key, member_id, hmac).then(function(data){ callback(null, {'cart': data}); }).catch(function (data) { if (data) { callback(new Error('422'), {'error': {code: data.code, message: data.message}}); } else { callback(new Error('422'), {'error': {code: 422, message: 'This sdk is not available on the current page'}}); } }); }, precreateOrder: function (mall_id, time, app_key, member_id, hmac, callback) { if (!CAFE24API.__scopeErr(callback, 'order')) { return; } CAPP_ASYNC_METHODS.AppCommon.precreateOrder(mall_id, time, app_key, member_id, hmac).then(function(data){ callback(null, {'order': data}); }).catch(function (data) { if (data) { callback(new Error('422'), {'error': {code: data.code, message: data.message}}); } else { callback(new Error('422'), {'error': {code: 422, message: 'This sdk is not available on the current page'}}); } }); }, getOrderItemList: function (start_date, end_date, order_status, page, count, order_id, callback) { if (!CAFE24API.__scopeErr(callback, 'order')) { return; } CAPP_ASYNC_METHODS.AppCommon.getOrderItemList(start_date, end_date, order_status, page, count, order_id).then(function(data){ callback(null, {'items': data}); }).catch(function (data) { if (data) { callback(new Error('422'), {'error': {code: data.code, message: data.message}}); } else { callback(new Error(422), { 'error': { code: 422, message: 'This sdk is not available on the current page' } }); } }); }, getOrderDetailInfo: function (shop_no, order_id, callback) { if (!CAFE24API.__scopeErr(callback, 'order')) { return; } CAPP_ASYNC_METHODS.AppCommon.getOrderDetailInfo(shop_no, order_id).then(function(data){ callback(null, {'orders': data}); }).catch(function (data) { if (data) { callback(new Error('422'), {'error': {code: data.code, message: data.message}}); } else { callback(new Error(422), { 'error': { code: 422, message: 'This sdk is not available on the current page' } }); } }); }, getClaimableItemList: function (order_id, customer_service_type, callback) { if (!CAFE24API.__scopeErr(callback, 'order')) { return; } CAPP_ASYNC_METHODS.AppCommon.getClaimableItemList(order_id, customer_service_type).then(function(data){ callback(null, {'items': data}); }).catch(function (data) { if (data) { callback(new Error('422'), {'error': {code: data.code, message: data.message}}); } else { callback(new Error(422), { 'error': { code: 422, message: 'This sdk is not available on the current page' } }); } }); }, emptyCart: function (basket_shipping_type, callback) { if (!CAFE24API.__scopeErr(callback, 'personal')) { return; } CAPP_ASYNC_METHODS.AppCommon.emptyCart(basket_shipping_type).then(function (data) { callback(null, {'result': data}); }).catch(function (data) { if (data) { callback(new Error('422'), {'error': {code: data.code, message: data.message}}); } else { callback(new Error(422), { 'error': { code: 422, message: 'This sdk is not available on the current page' } }); } }) ; }, deleteCartItems: function (basket_shipping_type, product_list, callback) { if (!CAFE24API.__scopeErr(callback, 'personal')) { return; } CAPP_ASYNC_METHODS.AppCommon.deleteCartItems(basket_shipping_type, product_list).then(function (data) { callback(null, {'result': data}); }).catch(function (data) { if (data) { callback(new Error('422'), {'error': {code: data.code, message: data.message}}); } else { callback(new Error(422), { 'error': { code: 422, message: 'This sdk is not available on the current page' } }); } }) ; }, addCart: function (basket_type, prepaid_shipping_fee, product_list, callback) { if (!CAFE24API.__scopeErr(callback, 'personal')) { return; } CAPP_ASYNC_METHODS.AppCommon.addCart(basket_type, prepaid_shipping_fee, product_list).then(function (data) { callback(null, data); }).catch(function (data) { if (data) { callback(new Error('422'), {'error': {code: data.code, message: data.message}}); } else { callback(new Error(422), { 'error': { code: 422, message: 'This sdk is not available on the current page' } }); } }) }, addBundleProductsCart: function (basket_type, prepaid_shipping_fee, product_list, callback) { if (!CAFE24API.__scopeErr(callback, 'personal')) { return; } CAPP_ASYNC_METHODS.AppCommon.addBundleProductsCart(basket_type, prepaid_shipping_fee, product_list).then(function (data) { callback(null, data); }).catch(function (data) { if (data) { callback(new Error('422'), {'error': {code: data.code, message: data.message}}); } else { callback(new Error(422), { 'error': { code: 422, message: 'This sdk is not available on the current page' } }); } }) }, get : function(url, callback) { return CAFE24API.complete('GET', url, this, null, callback); }, post : function(url, params, callback) { return CAFE24API.complete('POST', url, this, params, callback); }, put : function(url, params, callback) { return CAFE24API.complete('PUT', url, this, params, callback); }, delete : function(url, callback) { return CAFE24API.complete('DELETE', url, this, null, callback); }, complete : function(method, url, obj, params, callback) { var xhr = CAFE24API.sendXhr(method, url, obj, params, callback); xhr.onreadystatechange = function () { if (xhr.readyState === XMLHttpRequest.DONE) { if (xhr.status >= 200 && xhr.status <= 208) { callback(null, JSON.parse(xhr.responseText)); } else { callback(new Error(xhr.status), JSON.parse(xhr.responseText)); } } }; }, sendXhr : function (method, url, obj, params, callback) { if (method !== 'POST') { var url = obj.fullPath(url); } var xhr = obj.initializeXhr(); var queryVars = {}; if (obj.clientId) queryVars['cafe24_app_key'] = obj.clientId; if (obj.version) queryVars['cafe24_api_version'] = obj.version; if (params === null) { var seperator = url.indexOf('?') == -1 ? '?' : '&'; var queryString = []; for (var key in queryVars) { queryString.push(key + '=' + queryVars[key]); } if (queryString.length > 0) { url = url + seperator + queryString.join('&'); } } xhr.open(method, url, true); if (typeof params == 'object' && params !== null) { xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded; charset=utf-8'); for (var key in queryVars) { params[key] = queryVars[key]; } params = 'formData=' + JSON.stringify(params); } xhr.send(params || null); return xhr; }, __sessionErr: function (callback) { callback(new Error(403), {'error': {code: 403, message: 'Failed to get session. Only available when log in.'}}); }, __scopeErr: function (callback, scope) { if (typeof CAFE24.APPSCRIPT_SDK_DATA != "undefined" && jQuery.inArray(scope, CAFE24.APPSCRIPT_SDK_DATA ) > -1 ) { return true; } callback(new Error(403), {'error': {code: 403, message: 'You do not have the necessary authority(scope) to use the SDK.'}}); }, __chkValidSessionScope: function (callback, scope) { if (!CAPP_ASYNC_METHODS.IS_LOGIN) { CAFE24API.__sessionErr(callback); return false; } if (!CAFE24API.__scopeErr(callback, scope)) { return false; } return true; } }; </script>
<script type="text/javascript">
window.CAFE24 = window.CAFE24 || {};
CAFE24.MANIFEST_CACHE_REVISION = '2310111247';
CAFE24.getDeprecatedNamespace = function(sDeprecatedNamespace, sSupersededNamespace) {
var sNamespace = sSupersededNamespace 
? sSupersededNamespace 
: sDeprecatedNamespace.replace(/^EC_/, '');
return CAFE24[sNamespace];
}
CAFE24.FRONT_LANGUAGE_CODE = "ko_KR";
CAFE24.MOBILE = false;
CAFE24.MOBILE_DEVICE = false;
CAFE24.MOBILE_USE = true;
var EC_MOBILE = CAFE24.MOBILE;
var EC_MOBILE_DEVICE = CAFE24.MOBILE_DEVICE;
var EC_MOBILE_USE = CAFE24.MOBILE_USE;
CAFE24.SKIN_CODE = "skin4";
CAFE24.FRONT_EXTERNAL_SCRIPT_VARIABLE_DATA = {"common_member_id_crypt":"5f9e4387b5c9e992e30e20a090e13f5c0dc3864c958b0d1f0abb290bf4a7d66d"};
var EC_FRONT_EXTERNAL_SCRIPT_VARIABLE_DATA = CAFE24.getDeprecatedNamespace('EC_FRONT_EXTERNAL_SCRIPT_VARIABLE_DATA');
CAFE24.SDE_SHOP_NUM = 1;CAFE24.SHOP = {getLanguage : function() { return "ko_KR"; },getCurrency : function() { return "KRW"; },getFlagCode : function() { return "KR"; },getTimezone: function() { return "Asia/Seoul" },getDateFormat: function() { return "Y-m-d" },isMultiShop : function() { return true; },isDefaultShop : function() { return true; },isDefaultLanguageShop : function(sLanguageCode) { return SHOP.isDefaultShop() && SHOP.isLanguageShop(sLanguageCode); },isKR : function() { return true; },isUS : function() { return false; },isJP : function() { return false; },isCN : function() { return false; },isTW : function() { return false; },isES : function() { return false; },isPT : function() { return false; },isVN : function() { return false; },isPH : function() { return false; },getCountryAndLangMap : function() { return {
"KR": "ko_KR",
"US": "en_US",
"JP": "ja_JP",
"CN": "zh_CN",
"TW": "zh_TW",
"VN": "vi_VN",
"PH": "en_PH"
}},isLanguageShop : function(sLanguageCode) { return sLanguageCode === "ko_KR"; },getDefaultShopNo : function() { return 1; },getProductVer : function() { return 2; },isSDE : function() { return true; },isMode : function() {return false; },getModeName : function() {return false; },isMobileAdmin : function() {return false; },isNewProMode : function() {return true; },isExperienceMall : function() { return false; },isDcollection : function() {return false; },getAdminID : function() {return '3094466536@k'},getMallID : function() {return 'afterblow'},getCurrencyFormat : function(sPriceTxt, bIsNumberFormat) { 
sPriceTxt = String(sPriceTxt);
var aCurrencySymbol = ["","\uc6d0",false];
if (typeof CAFE24.SHOP_PRICE !== 'undefined' && isNaN(sPriceTxt.replace(/[,]/gi, '')) === false && bIsNumberFormat === true) {
// bIsNumberFormat 사용하려면 Ui(':libUipackCurrency')->plugin('Currency') 화폐 라이브러리 추가 필요
sPriceTxt = CAFE24.SHOP_PRICE.toShopPrice(sPriceTxt.replace(/[,]/gi, ''), true, CAFE24.SDE_SHOP_NUM);
}
try {
var sPlusMinusSign = (sPriceTxt.toString()).substr(0, 1);
if (sPlusMinusSign === '-' || sPlusMinusSign === '+') {
sPriceTxt = (sPriceTxt.toString()).substr(1);
return sPlusMinusSign + aCurrencySymbol[0] + sPriceTxt + aCurrencySymbol[1];
} else {
return aCurrencySymbol[0] + sPriceTxt + aCurrencySymbol[1];
}
} catch (e) {
return aCurrencySymbol[0] + sPriceTxt + aCurrencySymbol[1];
}
}};CAFE24.CURRENCY_INFO = {getOriginReferenceCurrency : function() {return 'USD'},getCurrencyList : function(sCurrencyCode) { var aCurrencyList = {"JPY":{"currency_symbol":"&yen;","decimal_place":0,"round_method_type":"F"},"VND":{"currency_symbol":"&#8363;","decimal_place":0,"round_method_type":"F"},"PHP":{"currency_symbol":"&#8369;","decimal_place":2,"round_method_type":"R"},"USD":{"currency_symbol":"$","decimal_place":2,"round_method_type":"R"},"CNY":{"currency_symbol":"&yen;","decimal_place":2,"round_method_type":"R"},"TWD":{"currency_symbol":"NT$","decimal_place":0,"round_method_type":"F"},"EUR":{"currency_symbol":"\u20ac","decimal_place":2,"round_method_type":"R"},"BRL":{"currency_symbol":"R$","decimal_place":2,"round_method_type":"R"},"AUD":{"currency_symbol":"A$","decimal_place":2,"round_method_type":"R"},"BHD":{"currency_symbol":".&#1583;.&#1576;","decimal_place":3,"round_method_type":"R"},"BDT":{"currency_symbol":"&#2547;","decimal_place":2,"round_method_type":"R"},"GBP":{"currency_symbol":"&pound;","decimal_place":2,"round_method_type":"R"},"CAD":{"currency_symbol":"C$","decimal_place":2,"round_method_type":"R"},"CZK":{"currency_symbol":"K&#269;","decimal_place":2,"round_method_type":"R"},"DKK":{"currency_symbol":"kr","decimal_place":2,"round_method_type":"R"},"HKD":{"currency_symbol":"HK$","decimal_place":2,"round_method_type":"R"},"HUF":{"currency_symbol":"Ft","decimal_place":2,"round_method_type":"R"},"INR":{"currency_symbol":"&#8377;","decimal_place":2,"round_method_type":"R"},"IDR":{"currency_symbol":"Rp","decimal_place":0,"round_method_type":"F"},"ILS":{"currency_symbol":"&#8362;","decimal_place":2,"round_method_type":"R"},"JOD":{"currency_symbol":" &#1583;&#1610;&#1606;&#1575;&#1585;","decimal_place":3,"round_method_type":"R"},"KWD":{"currency_symbol":"&#1583;&#1610;&#1606;&#1575;&#1585;","decimal_place":3,"round_method_type":"R"},"MYR":{"currency_symbol":"RM","decimal_place":2,"round_method_type":"R"},"MXN":{"currency_symbol":"Mex$","decimal_place":2,"round_method_type":"R"},"NZD":{"currency_symbol":"NZ$","decimal_place":2,"round_method_type":"R"},"NOK":{"currency_symbol":"kr","decimal_place":2,"round_method_type":"R"},"PKR":{"currency_symbol":"&#8360;","decimal_place":2,"round_method_type":"R"},"PLN":{"currency_symbol":"z\u0142","decimal_place":2,"round_method_type":"R"},"RUB":{"currency_symbol":"\u0440\u0443\u0431","decimal_place":2,"round_method_type":"R"},"SAR":{"currency_symbol":"&#65020;","decimal_place":2,"round_method_type":"R"},"SGD":{"currency_symbol":"S$","decimal_place":2,"round_method_type":"R"},"ZAR":{"currency_symbol":"R","decimal_place":2,"round_method_type":"R"},"SEK":{"currency_symbol":"kr","decimal_place":2,"round_method_type":"R"},"CHF":{"currency_symbol":"Fr","decimal_place":2,"round_method_type":"R"},"THB":{"currency_symbol":"&#3647;","decimal_place":2,"round_method_type":"R"},"TRY":{"currency_symbol":"TL","decimal_place":2,"round_method_type":"R"},"AED":{"currency_symbol":"&#1601;&#1604;&#1587;","decimal_place":2,"round_method_type":"R"}}; return aCurrencyList[sCurrencyCode] },isUseReferenceCurrency : function() {return false }};CAFE24.COMMON_UTIL = {convertSslForString : function(sString) { return sString.replace(/http:/gi, '');},convertSslForHtml : function(sHtml) { return sHtml.replace(/((?:src|href)\s*=\s*['"])http:(\/\/(?:[a-z0-9\-_\.]+)\/)/ig, '$1$2');},getProtocol : function() { return 'https'; },moveSsl : function() { if (CAFE24.COMMON_UTIL.getProtocol() === 'http') { var oLocation = jQuery(window.location); var sUrl = 'https://' + oLocation.attr('host') + oLocation.attr('pathname') + oLocation.attr('search'); window.location.replace(sUrl); } },setEcCookie : function(sKey, sValue, iExpire) {var exdate = new Date();exdate.setDate(exdate.getDate() + iExpire);var setValue = escape(sValue) + "; domain=." + CAFE24.GLOBAL_INFO.getBaseDomain() + "; path=/;expires=" + exdate.toUTCString();document.cookie = sKey + "=" + setValue;}};CAFE24.SHOP_LIB_INFO = {getBankInfo : function() { 
var oBankInfo = "";
$.ajax({
type: "GET",
url: "/exec/front/Shop/Bankinfo",
dataType: "json",
async: false,
success: function(oResponse) {
oBankInfo = oResponse;
}
});
return oBankInfo; }};            var EC_SDE_SHOP_NUM = CAFE24.SDE_SHOP_NUM;
var SHOP = CAFE24.getDeprecatedNamespace('SHOP');
var EC_COMMON_UTIL = CAFE24.getDeprecatedNamespace('EC_COMMON_UTIL');
var EC_SHOP_LIB_INFO = CAFE24.getDeprecatedNamespace('EC_SHOP_LIB_INFO');
var EC_CURRENCY_INFO = CAFE24.getDeprecatedNamespace('EC_CURRENCY_INFO');
CAFE24.ROOT_DOMAIN = "cafe24.com";
CAFE24.API_DOMAIN = "cafe24api.com";
CAFE24.TRANSLATE_LOG_STATUS = "F";
CAFE24.GLOBAL_INFO = (function() {
var oData = {"base_domain":"afterblow.cafe24.com","root_domain":"cafe24.com","api_domain":"cafe24api.com","is_global":false,"is_global_standard":false,"country_code":"KR","language_code":"ko_KR","admin_language_code":"ko_KR"};
return {
getBaseDomain: function() {
return oData['base_domain'];
},
getRootDomain: function() {
return oData['root_domain'];
},
getApiDomain: function() {
return oData['api_domain'];
},
isGlobal: function() {
return oData['is_global'];
},
isGlobalStandard: function() {
return oData['is_global_standard'];
},
getCountryCode: function() {
return oData['country_code'];
},
getLanguageCode: function() {
return oData['language_code'];
},
getAdminLanguageCode: function() {
return oData['admin_language_code'];
}
};
})();
var EC_ROOT_DOMAIN = CAFE24.ROOT_DOMAIN;
var EC_API_DOMAIN = CAFE24.API_DOMAIN;
var EC_TRANSLATE_LOG_STATUS = CAFE24.TRANSLATE_LOG_STATUS;
var EC_GLOBAL_INFO = CAFE24.getDeprecatedNamespace('EC_GLOBAL_INFO');
CAFE24.AVAILABLE_LANGUAGE = ["ko_KR","zh_CN","en_US","zh_TW","es_ES","pt_PT","vi_VN","ja_JP","en_PH"];
CAFE24.AVAILABLE_LANGUAGE_CODES = {"ko_KR":"KOR","zh_CN":"CHN","en_US":"ENG","zh_TW":"TWN","es_ES":"ESP","pt_PT":"PRT","vi_VN":"VNM","ja_JP":"JPN","en_PH":"PHL"};
var EC_AVAILABLE_LANGUAGE = CAFE24.AVAILABLE_LANGUAGE;
var EC_AVAILABLE_LANGUAGE_CODES = CAFE24.AVAILABLE_LANGUAGE_CODES;
CAFE24.GLOBAL_PRODUCT_LANGUAGE_CODES = {  
sClearanceCategoryCode: '',
sManualLink: '//support.cafe24.com/hc/ko/articles/7739013909529',
sHsCodePopupLink: 'https://www.wcotradetools.org/en/harmonized-system',
aCustomRegex: '"PHL" : "^[0-9]{8}[A-Z]?$"',
sCountryCodeData: 'kor',
sEnglishExampleURlForGlobal: '',
aReverseAddressCountryCode: ["VNM","PHL"],
aSizeGuideCountryAlign: '["US","UK","EU","KR","JP","CN"]',
aIsSupportTran: ["ja_JP","zh_CN","zh_TW","en_US","vi_VN","en_PH","pt_PT","es_ES"]
};
var EC_GLOBAL_PRODUCT_LANGUAGE_CODES = CAFE24.getDeprecatedNamespace('EC_GLOBAL_PRODUCT_LANGUAGE_CODES');
CAFE24.GLOBAL_ORDER_LANGUAGE_CODES = {
aModifyOrderLanguage: {"KR":"ko_KR","JP":"ja_JP","CN":"zh_CN","TW":"zh_TW","VN":"vi_VN","PH":"en_PH"},
aUseIdCardKeyCountry: ["CN","TW"],
aLanguageWithCountryCode: {"zh_CN":["CN","CHN","HK","HNK"],"ja_JP":["JP","JPN"],"zh_TW":["TW","TWN"],"ko_KR":["KR","KOR"],"vi_VN":["VN","VNM"],"en_PH":["PH","PHL"]},
aCheckDisplayRequiredIcon: ["ja_JP","zh_CN","zh_TW","en_US","vi_VN","en_PH"],
aSetReceiverName: {"zh_CN":{"sCountry":"CN","bUseLastName":true},"zh_TW":{"sCountry":"TW","bUseLastName":false},"ja_JP":{"sCountry":"JP","bUseLastName":true}},
aSetDeferPaymethodLanguage: {"ja_JP":"\uc77c\ubcf8","zh_CN":"\uc911\uad6d"},
aUseDeferPaymethod: ["ja_JP","zh_CN"],
aCheckShippingCompanyAndPaymethod: ["ja_JP","zh_CN"],
aSetDeferPaymethodLanguageForShipping: {"ja_JP":"\u65e5\u672c","zh_CN":"\uc911\uad6d"},
aCheckStoreByPaymethod: ["ja_JP","zh_CN"],
aCheckIsEmailRequiredForJs: ["en_US","zh_CN","zh_TW","ja_JP","vi_VN","en_PH"],
aSetIdCardKeyCountryLanguage: {"CN":"\uc911\uad6d\uc758","TW":"\ub300\ub9cc\uc758"},
aReverseGlobalAddress: ["en_PH","vi_VN","PHL","VNM","VN","PH"],
aNoCheckZipCode: ["KOR","JPN"],
aNotPostCodeAPICountryList: ["en_US","es_ES","pt_PT","en_PH"],
aEnableSearchExchangeAddr: ["KR","JP","CN","VN","TW","PH"],
aDuplicatedBaseAddr: ["TW","JP"],
aReverseAddressCountryCode: ["VN","PH"],
aCheckZipCode: ["PHL","en_PH","PH"]
};
var EC_GLOBAL_ORDER_LANGUAGE_CODES = CAFE24.getDeprecatedNamespace('EC_GLOBAL_ORDER_LANGUAGE_CODES');
CAFE24.GLOBAL_MEMBER_LANGUAGE_CODES = {  
sAdminWebEditorLanguageCode: 'ko' ,
oNotAvailDecimalPointLanguages: ["ko_KR","ja_JP","zh_TW","vi_VN"],
oAddressCountryCode: {"KOR":"ko_KR","JPN":"ja_JP","CHN":"zh_CN","TWN":"zh_TW","VNM":"vi_VN","PHL":"en_PH"},
};
var EC_GLOBAL_MEMBER_LANGUAGE_CODES = CAFE24.getDeprecatedNamespace('EC_GLOBAL_MEMBER_LANGUAGE_CODES');
CAFE24.GLOBAL_BOARD_LANGUAGE_CODES = {  
bUseLegacyBoard: true
};
var EC_GLOBAL_BOARD_LANGUAGE_CODES = CAFE24.getDeprecatedNamespace('EC_GLOBAL_BOARD_LANGUAGE_CODES');
CAFE24.GLOBAL_MALL_LANGUAGE_CODES = {
oDesign: {
oDesignAddReplaceInfo: {"group_id":"SKIN.ADD.ADMIN.DESIGNDETAIL","replacement":{"KR":"KOREAN","US":"ENGLISH","JP":"JAPANESE","CN":"SIMPLIFIED.CHINESE","TW":"TRADITIONAL.CHINESE","ES":"SPANISH","PT":"PORTUGUESE","PH":"ENGLISH"}},
oDesignDetailLanguageCountryMap: {"KR":"ko_KR","JP":"ja_JP","CN":"zh_CN","TW":"zh_TW","US":"en_US","ES":"es_ES","PT":"pt_PT","PH":"en_PH"},
oSmartDesignSwitchTipLink: {"edibot":{"img":"\/\/img.echosting.cafe24.com\/smartAdmin\/img\/design\/img_editor_dnd.png","link":"\/\/ecsupport.cafe24.com\/board\/free\/list.html?board_act=list&board_no=12&category_no=9&cate_no=9"},"smart":{"img":"\/\/img.echosting.cafe24.com\/smartAdmin\/img\/design\/ko_KR\/img_editor_smart.png","link":"\/\/sdsupport.cafe24.com"}},
oSmartDesignDecoShopList: ["ko_KR","ja_JP","zh_CN","en_US","zh_TW","es_ES","pt_PT"],
oSmartDesignDecoMultilingual: {"list":{"ko_KR":"KOREAN","en_US":"ENGLISH","ja_JP":"JAPANESE","zh_CN":"SIMPLIFIED.CHINESE","zh_TW":"TRADITIONAL.CHINESE","es_ES":"SPANISH","pt_PT":"PORTUGUESE","vi_VN":"VIETNAMESE"},"group_id":"EDITOR.LAYER.EDITING.DECO"},
aSmartDesignModuleShopList: ["ko_KR","ja_JP","zh_CN","en_US","zh_TW","es_ES","pt_PT"]
},
oStore: {
oMultiShopCurrencyInfo: {"en_US":{"currency":"USD"},"zh_CN":{"currency":"USD","sub_currency":"CNY"},"ja_JP":{"currency":"JPY"},"zh_TW":{"currency":"TWD"},"es_ES":{"currency":"EUR"},"pt_PT":{"currency":"EUR"},"ko_KR":{"currency":"KRW"},"vi_VN":{"currency":"VND"},"en_PH":{"currency":"PHP"}},
oBrowserRedirectLanguage: {"ko":{"primary":"ko_KR","secondary":"en_US"},"en":{"detail":{"en-ph":{"primary":"en_PH","secondary":"en_US"},"en-us":{"primary":"en_US","secondary":"es_ES"},"default":{"primary":"en_US","secondary":"es_ES"}}},"ja":{"primary":"ja_JP","secondary":"en_US"},"zh":{"detail":{"zh-cn":{"primary":"zh_CN","secondary":"en_US"},"zh-tw":{"primary":"zh_TW","secondary":"zh_CN"},"default":{"primary":"en_US","secondary":"ko_KR"}}},"es":{"primary":"es_ES","secondary":"en_US"},"pt":{"primary":"pt_PT","secondary":"en_US"},"vi":{"primary":"vi_VN","secondary":"en_US"},"default":{"primary":"en_US","secondary":"ko_KR"}},
aChangeableLanguages: ["en_US","ja_JP","ko_KR"],
aNoZipCodeLanguage: ["ko_KR","ja_JP"]
},
oMobile: {
sSmartWebAppFaqUrl: "https://support.cafe24.com/hc/ko/articles/8466586607641",
sAmpFaqUrl: "https://ecsupport.cafe24.com/board/free/read.html?no=1864&board_no=5&category_no=13&cate_no=13&category_no=13&category_no=13",
},
oPromotion: {
bQrCodeAvailable: true,
bSnsMarketingAvailable: true
},
oShippingReverseAddressLanguage: ["vi_VN","en_PH"] ,
oGlobalStandardSwitchHelpCodeLink: {"SH.DS":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/SH.DS.html"},"PR.DS":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/PR.DS.html"},"OR.SM.BO":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/OR.SM.BO.html"},"DE.DS":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/DE.DS.html"},"MB.DS":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/MB.DS.html"},"PM.DS":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/PM.DS.html"}},
getAdminMainLocaleLanguage: function(sSkinLocaleCode) {
var oLocaleData = [];
var locale = "";
var shopLangName = "";
if (sSkinLocaleCode == "US") {
locale = "en_US";
shopLangName = "ENGLISH";
} else if (sSkinLocaleCode == "JP") {
locale = "ja_JP";
shopLangName = "JAPANESE";
} else if (sSkinLocaleCode == "CN") {
locale = "zh_CN";
shopLangName = "SIMPLIFIED.CHINESE";
} else if (sSkinLocaleCode == "TW") {
locale = "zh_TW";
shopLangName = "TRADITIONAL.CHINESE";
} else if (sSkinLocaleCode == "ES") {
locale = "es_ES";
shopLangName = "SPANISH";
} else if (sSkinLocaleCode == "PT") {
locale = "pt_PT";
shopLangName = "PORTUGUESE";
} else if (sSkinLocaleCode == "VN") {
locale = "vi_VN";
shopLangName = "VIETNAMESE";
} else if(sSkinLocaleCode == "PH") {
locale = "en_PH";
shopLangName = "ENGLISH.PH";
}
oLocaleData["locale"] = locale;
oLocaleData["shopLangName"] = shopLangName;
return oLocaleData;
}
};
var EC_GLOBAL_MALL_LANGUAGE_CODES = CAFE24.getDeprecatedNamespace('EC_GLOBAL_MALL_LANGUAGE_CODES');
CAFE24.GLOBAL_DATETIME_INFO = {
oConstants: {"STANDARD_DATE_REGEX":"\/([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))\/","IN_ZONE":"inZone","OUT_ZONE":"outZone","IN_FORMAT":"inFormat","OUT_FORMAT":"outFormat","IN_DATE_FORMAT":"inDateFormat","IN_TIME_FORMAT":"inTimeFormat","OUT_DATE_FORMAT":"outDateFormat","OUT_TIME_FORMAT":"outTimeFormat","IN_FORMAT_DATE_ONLY":1,"IN_FORMAT_TIME_ONLY":2,"IN_FORMAT_ALL":3,"OUT_FORMAT_DATE_ONLY":1,"OUT_FORMAT_TIME_ONLY":2,"OUT_FORMAT_ALL":3,"DATE_ONLY":"YYYY-MM-DD","TIME_ONLY":"HH:mm:ss","FULL_TIME":"YYYY-MM-DD HH:mm:ss","ISO_8601":"YYYY-MM-DD[T]HH:mm:ssZ","YEAR_ONLY":"YYYY","MONTH_ONLY":"MM","DAY_ONLY":"DD","WEEK_ONLY":"e","TIME_H_I_ONLY":"HH:mm","TIME_HOUR_ONLY":"HH","TIME_MINUTE_ONLY":"mm","POSTGRE_FULL_TIME":"YYYY-MM-DD HH24:MI:SS","POSTGRE_TIME_ONLY":" HH24:MI:SS","MICRO_SECOND_ONLY":"u","SEOUL":"Asia\/Seoul","TOKYO":"Asia\/Tokyo","SHANGHAI":"Asia\/Shanghai","TAIPEI":"Asia\/Taipei","HANOI":"Asia\/Bangkok","LOS_ANGELES":"America\/Los_Angeles","LISBON":"Europe\/Lisbon","MADRID":"Europe\/Madrid","SINGAPORE":"Asia\/Singapore","UTC":"Etc\/UTC","MAX_DATETIME":"9999-12-31 23:59:59"},
oOptions: {"inZone":"Asia\/Seoul","inFormat":"YYYY-MM-DD HH:mm:ss","inDateFormat":"YYYY-MM-DD","inTimeFormat":"HH:mm:ss","outZone":"Asia\/Seoul","outFormat":"YYYY-MM-DD HH:mm:ss","outDateFormat":"YYYY-MM-DD","outTimeFormat":"HH:mm:ss"},
oPolicies: {"shop":{"outZone":"Asia\/Seoul","outFormat":"YYYY-MM-DD HH:mm:ss","outDateFormat":"YYYY-MM-DD","outTimeFormat":"HH:mm:ss"}},
sOverrideTimezone: '',
sMomentNamespace: 'EC_GLOBAL_MOMENT'
};
CAFE24.FRONT_JS_CONFIG_MANAGE = {"sSmartBannerScriptUrl":"https:\/\/app4you.cafe24.com\/SmartBanner\/tunnel\/scriptTags?vs=1563164396689206","sMallId":"afterblow","sDefaultAppDomain":"https:\/\/app4you.cafe24.com","sWebLogOffFlag":"F"};
var EC_FRONT_JS_CONFIG_MANAGE = CAFE24.getDeprecatedNamespace('EC_FRONT_JS_CONFIG_MANAGE');
CAFE24.FRONT_JS_CONFIG_MEMBER = {"sAuthUrl":"https:\/\/i-pin.cafe24.com\/certify\/1.0\/?action=auth"};
var EC_FRONT_JS_CONFIG_MEMBER = CAFE24.getDeprecatedNamespace('EC_FRONT_JS_CONFIG_MEMBER');
CAFE24.FRONT_JS_CONFIG_SHOP = {"aProductPurchaseInfo_44":{"bIsSuccess":true,"sMessage":"","bReplaceLoginPage":false,"bIsDisplayPurchaseButton":true,"bExclusivePurchaseOnly":false},"aProductPurchaseInfo_58":{"bIsSuccess":true,"sMessage":"","bReplaceLoginPage":false,"bIsDisplayPurchaseButton":true,"bExclusivePurchaseOnly":false},"bIsLogin":true};
var EC_FRONT_JS_CONFIG_SHOP = CAFE24.getDeprecatedNamespace('EC_FRONT_JS_CONFIG_SHOP');
typeof window.CAFE24 === "undefined" && (window.CAFE24 = {});
CAFE24.FRONTEND = {"FW_MANIFEST_CACHE_REVISION":2310111247,"IS_WEB_VIEW":"F"};
CAFE24.ROUTE = {"is_mobile":false,"is_need_route":false,"language_code":"ZZ","path":{"origin":"\/myshop\/wish_list.html","result":"\/myshop\/wish_list.html","prefix":""},"shop_no":0,"skin_code":"default","support_language_list":{"ar":"ar_EG","ar-EG":"ar_EG","de":"de_DE","de-DE":"de_DE","en":"en_US","en-IN":"en_IN","en-PH":"en_PH","en-US":"en_US","es":"es_ES","es-ES":"es_ES","hi":"hi_IN","hi-IN":"hi_IN","id":"id_ID","id-ID":"id_ID","it":"it_IT","it-IT":"it_IT","ja":"ja_JP","ja-JP":"ja_JP","ko":"ko_KR","ko-KR":"ko_KR","ms":"ms_MY","ms-MY":"ms_MY","pt":"pt_PT","pt-PT":"pt_PT","ru":"ru_RU","ru-RU":"ru_RU","th":"th_TH","th-TH":"th_TH","tr":"tr_TR","tr-TR":"tr_TR","vi":"vi_VN","vi-VN":"vi_VN","zh":"zh_CN","zh-CN":"zh_CN","zh-HK":"zh_HK","zh-MO":"zh_MO","zh-SG":"zh_SG","zh-TW":"zh_TW"}};
</script>

<link rel="stylesheet" type="text/css" href="/ind-script/optimizer.php?filename=nc1LCoAwDIThfXHrOYLeqC3xAU2mpCno7RW8gHQ7zMdPB4RpWY2qYbcoZNzQLTPl1mgzqFOGCHR6h5n-_DmHhtL9hIaEaxB299FoiTfbGPWYCg9S1FBO5ZCi6td_AA&type=css&k=37c9481ac0212340e132f81eba4d1049fee7f18e&t=1681776733"  /><link rel="stylesheet" type="text/css" href="/ind-script/optimizer_user.php?filename=tdRBTgUhDADQ_cet52hivIknKFCHRqCEgt9_exmdeACBJZS8QoFCkERAznSlqoDvjaqNcofSbWRnQksR1JPxpHxk0A_Or-BUIYnvkSA9NEiBO2uIrO1phJ7hX2jEh_QGFpXdTwYnKUleKf5OrBTJ3caAbp13qE0kNi476EBxi1vqeBduS40LHpyx0ZZKo93B2t7a2if8J8vXpjrELQUeq9yEe1KeGnJcgrxMKmjHKU2R0rd8ohGgOrnFqz9fOVIfjeTs1G-BS-F8LNWd5M8BsOQye8mB0E-f_WpCRgmrCyf2DQ&type=css&k=84bd20731dbef63e92f8188b21dbdc703dee4d94&t=1641537240&user=T"  />

<title>Afterblow</title>
<meta name="path_role" content="MYSHOP_WISHLIST" />
<meta name="keywords" content="Afterblow" /></head><body><!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WRJFFQB" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<div id="skipNavigation"><p><a href="#category">전체상품목록 바로가기</a></p><p><a href="#contents">본문 바로가기</a></p></div>


    <div class="xans-element- xans-layout xans-layout-logotop "></div>

    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



<div id="Header_wrap">
    
<div class="header_line" style="display:none;">　</div>  
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<style>
.notice-top-line {
	position: relative;
    /*background-color: #1D1B0C;*/
}

.notice-top-line .inner {
	width: 100%;
	display: flex;
	align-items: center;
}

.notice-top-line .inner .swiper {
	width: 100%;
	height: 42px;
}

.notice-top-line .inner .swiper .swiper-slide {
	height: 42px;
    width:100%;
    background-color:#1D1B0C;
    text-align: center;
}

 .notice-top-line .inner .swiper .swiper-slide:nth-child(2){
	height: 42px;
    width:100%;
    background-color:#1D1B0C;
    text-align: center;
}
/* 나중에 6번째 추가할 때 복사하기 */
.notice-top-line .inner .swiper .swiper-slide:nth-child(3){
    background-color:#bab8ac;
}
    .notice-top-line .inner .swiper .swiper-slide:nth-child(1){
  height: 42px;
    width:100%;
    background-color:#1D1B0C;
    text-align: center;
}

.notice-top-line .inner .swiper .swiper-slide img {    
    height: 42px;
}    
</style>

		<div class="notice-top-line" id="pop_top_layer_slide">
			<div class="inner">
				<div class="swiper topSwiper"> 
					<div class="swiper-wrapper">
                            <div class="swiper-slide">
							<a href="https://www.afterblow-scent.com/article/event/8/7/page/2/" target="_self"><img src="https://afterblow.cafe24.com/web/%EB%9D%A0%EB%B0%B0%EB%84%88/%ED%95%9C%EA%B8%80%EB%9D%A0%EB%B0%B0%EB%84%88/line_bn_w_1_.jpg" data-edate="2025-09-12T23:59:00"/></a>
						</div>
                        <div class="swiper-slide">
							<a href="https://www.afterblow-scent.com/article/event/8/1311/" target="_self"><img src="https://afterblow.cafe24.com/web/%EB%9D%A0%EB%B0%B0%EB%84%88/%ED%95%9C%EA%B8%80%EB%9D%A0%EB%B0%B0%EB%84%88/line_bn_w_2.jpg" data-edate="2025-09-12T23:59:00"/></a>
						</div>
                        
                        <!-- 아이템5 -->
						<div class="swiper-slide">
							<a href="https://gift.kakao.com/brand/14180" target="_self"><img src="https://afterblow.cafe24.com/web/%EB%9D%A0%EB%B0%B0%EB%84%88/%ED%95%9C%EA%B8%80%EB%9D%A0%EB%B0%B0%EB%84%88/line_bn_w_3.jpg" data-edate="2025-12-31T23:00:00"/></a>
						</div>
                        <!--// 아이템5 -->
                   						<div class="swiper-slide" style="display:none;">
							<a href="http://afterblow-scent.com/article/event/8/9/" target="_self"><img src="/web/upload/%EB%9D%A0%EB%B0%B0%EB%84%882/line_bn_w_3_02.jpg" data-edate="2022-01-31T23:00:00"/></a>
						</div>
						<div class="swiper-slide">
							<a href="http://afterblow-scent.com/article/event/8/8/" target="_self"><img src="/web/upload/%EB%9D%A0%EB%B0%B0%EB%84%882/line_bn_w_1_02_02.jpg" data-edate="2022-12-31T23:00:00"/></a>
						</div>
						<div class="swiper-slide">
							<a href="http://afterblow-scent.com/article/event/8/7/" target="_self"><img src="/web/upload/%EB%9D%A0%EB%B0%B0%EB%84%882/line_bn_w_2_02.jpg" data-edate="2022-12-31T23:00:00"/></a>
						</div>
					</div>
				</div>
			</div>
		</div>
                        

		<script>
			// 띠배너 레이어 이미지 종료일시 비교 로직
			fnTopEDateChk();

			function fnTopEDateChk(){
				var total_count = $("#pop_top_layer_slide").find("img").length;
				var total_view = 0;
				$("#pop_top_layer_slide").find("img").each(function(){
					var edate = $(this).data('edate');
					var view = fnDateCheckTop2(edate);
					if (view == 0) {
						$(this).parents('.swiper-slide').attr("style", "display:block");
					} else {
						total_view += 1;
						$(this).parents('.swiper-slide').attr("style", "display:none");
					}
				});
				
				//모든 이미지가 종료된 거면
				if(total_count == total_view){
					$("#pop_top_layer_slide").attr("style", "display:none");
				}
			}
			
			function fnDateCheckTop2(strVal){
				var endDate = new Date(strVal);
                //console.log('endDate='+endDate);

				var nowDate = new Date();
                //console.log('nowDate='+nowDate);
                
                var elapsedMSec = (endDate.getTime() - nowDate.getTime() ) / 1000;
                //console.log('elapsedMSec='+elapsedMSec);

				if (elapsedMSec > 0) {	// 종료일시 >= 오늘현재시간                
					var rt = 0;
					//console.log('return='+rt);
					return rt;
				} else {			
					var rt = 1;
					//console.log('return='+rt);
					return rt;
				}
			}
		</script>

        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/><script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script><script>
            var swiper = new Swiper(".topSwiper", {		
                direction: 'vertical',
                autoplay: {
                    delay: 3000,
                },
            });
        </script><div id="Header">
<div class="Nav">       
<div class="Header">    
<div class="logo">
<a href="/index.html"><img src="/web/upload/category/editor/2021/12/10/c455c97e4a2edc6a924d31b9c1595835.png" height="20px;"/></a>    
</div>  
    
<div class="menu_list">
<ul class="menu"><li><a href="/shopinfo/company.html">ABOUT</a></li>     
<li class="drop"><p class="xans-element- xans-layout xans-layout-category"><a href="/product/list.html?cate_no=43" class="xans-record-">SHOP</a>
<a href="/product/list.html?cate_no=24" style="display:none;" class="xans-record-"></a><a href="/product/list.html?cate_no=25" style="display:none;" class="xans-record-"></a><a href="/product/list.html?cate_no=47" style="display:none;" class="xans-record-"></a><a href="/product/list.html?cate_no=26" style="display:none;" class="xans-record-"></a></p>
<ul class="sub sub1"><div class="inner">      
<ul class="xans-element- xans-layout xans-layout-category"><p class="xans-record-"><a href="/product/list.html?cate_no=43">- ALL</a></p>
<p class="xans-record-"><a href="/product/list.html?cate_no=24">- Perfume</a></p>
<p class="xans-record-"><a href="/product/list.html?cate_no=25">- Hand Cream</a></p>
<p class="xans-record-"><a href="/product/list.html?cate_no=47">- Hand Wash</a></p>
<p class="xans-record-"><a href="/product/list.html?cate_no=26">- Acc</a></p>
</ul>
</div>    
</ul></li>       
<li><a href="/product/lookbook.html?cate_no=42">SCENT</a></li>   
<li class="drop"><a href="/front/php/b/board_list.php?board_no=8">BOARD</a>
<ul class="sub"><div class="xans-element- xans-layout xans-layout-boardinfo inner"><ul>
<p class="xans-record-"><a href="/board/event/8/">- EVENT</a></p>   
<p class="xans-record-"><a href="/board/notice/1/">- NOTICE</a></p>
<p class="xans-record-"><a href="/board/faq/3/">- FAQ</a></p>
<p class="xans-record-"><a href="/board/review/4/">- REVIEW</a></p>
  
</ul>
</div>
    
</ul></li>       
</ul></div> <!-- //.menu_list -->
    
<div class="membership_list">
<ul class="menu">    
   
<li class="xans-element- xans-layout xans-layout-statelogon "><a href="/exec/front/Member/logout/">LOGOUT</a>
</li>
      
<li class="xans-element- xans-layout xans-layout-statelogon "><a href="/myshop/index.html">MYPAGE</a>
</li>
   
<li class="xans-element- xans-layout xans-layout-orderbasketcount "><a href="/order/basket.html">CART(0)</a>
</li>
      
</ul></div> <!-- //.menu_list -->    
    
</div>  <!-- //.Header -->   
 </div>  <!-- //#Nav -->       
</div>  <!-- //#Header -->    
    
    
    
</div>    
<div id="wrap">    
<div id="wrap_inner">     
<div id="container">
<div id="contents">

<div class="titleArea">
  <h2>관심상품</h2>
</div>

<div class="xans-element- xans-myshop xans-myshop-wishlist ec-base-table typeList xans-record-"><!--
        $login_page = /member/login.html
        $count = 10
    -->
<table border="1" summary="" class="">
<caption>관심상품 목록</caption>
        <colgroup>
<col style="width:27px;"/>
<col style="width:92px"/>
<col style="width:auto"/>
<col style="width:105px"/>
<col style="width:100px"/>
<col style="width:100px"/>
<col style="width:85px"/>
<col style="width:105px"/>
<col style="width:110px"/>
</colgroup>
<thead><tr>
<th scope="col"><input type="checkbox" onclick="NewWishlist.checkAll(this);"/></th>
                <th scope="col">이미지</th>
                <th scope="col">상품정보</th>
                <th scope="col">판매가</th>
                <th scope="col">적립금</th>
                <th scope="col">배송구분</th>
                <th scope="col">배송비</th>
                <th scope="col">합계</th>
                <th scope="col">선택</th>
            </tr></thead><tbody class="xans-element- xans-myshop xans-myshop-wishlistitem center"><tr class="xans-record-">
<td><input name="wish_idx[]" id="wish_idx_0" enable-order="1" reserve-order="N" enable-purchase="1" class="" is-set-product="F" value="157" type="checkbox"  /></td>
                <td class="thumb"><a href="/product/오-드-퍼퓸-01-텐더-우드-25ml/44/category/24/"><img src="//afterblow-scent.com/web/product/medium/202301/2c6b9dc9c35a3810716455d8412130c1.jpg" alt=""/></a></td>
                <td class="left">
                    <strong class="name"><a href="/product/오-드-퍼퓸-01-텐더-우드-25ml/44/category/24/" class="ec-product-name">오 드 퍼퓸 01 텐더 우드 25ml</a></strong>
                    <ul class="xans-element- xans-myshop xans-myshop-optionall option"><li class="xans-record-">
<strong class="displaynone"></strong> <span class="displaynone">(개)</span><br/><a href="#none" onclick="NewWishlist.showOptionChangeLayer('wishlist_option_modify_layer_0')" class="btnNormal gBlank5 displaynone">옵션변경</a>
                            <div class="optionModify ec-base-layer" id="wishlist_option_modify_layer_0">
                                <div class="header">
                                    <h3>옵션변경</h3>
                                </div>
                                <div class="content">
                                    <ul class="prdInfo">
<li></li>
                                        <li class="option"></li>
                                    </ul>
<div class="prdModify">
                                        <h4>상품옵션</h4>
                                        </div>
                                </div>
                                <div class="ec-base-button">
                                    <a href="#none" class="btnSubmitFix sizeS " onclick="NewWishlist.modify('add', '0', '44');">추가</a>
                                    <a href="#none" class="btnNormalFix sizeS" onclick="NewWishlist.modify('update', '0', '44');">변경</a>
                                </div>
                                <a href="#none" class="close" onclick="$('.optionModify').hide();"><img src="//img.echosting.cafe24.com/skin/base/common/btn_close.gif" alt="닫기"/></a>
                            </div>

                        </li>
</ul>
</td>
                <td>
<strong class="">37,800원<br/></strong><br/><strong class="displaynone">37800</strong>
</td>
                <td><span class="txtInfo"></span></td>
                <td><div class="txtInfo">기본배송<div class="displaynone">(해외배송가능)</div>
</div></td>
                <td>
<span class="">2,500원<br/></span> 조건</td>
                <td class="price">40,300원</td>
                <td class="button">
                    <a href="#none" onclick="NewWishlist.actionOrder('order', 0)" class="btnBasic ">주문하기</a>
                    <a href="#none" onclick="NewWishlist.actionOrder('basket', 0)" class="btnNormal ">장바구니담기</a>
                    <a href="#none" class="btnNormal btn_wishlist_del" rel="44||000C||"><i class="icoDelete"></i> 삭제</a>
                </td>
            </tr>
<tr class="xans-record-">
<td><input name="wish_idx[]" id="wish_idx_1" enable-order="1" reserve-order="N" enable-purchase="1" class="" is-set-product="F" value="156" type="checkbox"  /></td>
                <td class="thumb"><a href="/product/오-드-퍼퓸-05-로즈-부케-25ml/58/category/24/"><img src="//afterblow-scent.com/web/product/medium/202308/1c7e68cd3b34ecca55b9b99bd3a67605.jpg" alt=""/></a></td>
                <td class="left">
                    <strong class="name"><a href="/product/오-드-퍼퓸-05-로즈-부케-25ml/58/category/24/" class="ec-product-name">오 드 퍼퓸 05 로즈 부케 25ml</a></strong>
                    <ul class="xans-element- xans-myshop xans-myshop-optionall option"><li class="xans-record-">
<strong class="displaynone"></strong> <span class="displaynone">(개)</span><br/><a href="#none" onclick="NewWishlist.showOptionChangeLayer('wishlist_option_modify_layer_1')" class="btnNormal gBlank5 displaynone">옵션변경</a>
                            <div class="optionModify ec-base-layer" id="wishlist_option_modify_layer_1">
                                <div class="header">
                                    <h3>옵션변경</h3>
                                </div>
                                <div class="content">
                                    <ul class="prdInfo">
<li></li>
                                        <li class="option"></li>
                                    </ul>
<div class="prdModify">
                                        <h4>상품옵션</h4>
                                        </div>
                                </div>
                                <div class="ec-base-button">
                                    <a href="#none" class="btnSubmitFix sizeS " onclick="NewWishlist.modify('add', '1', '58');">추가</a>
                                    <a href="#none" class="btnNormalFix sizeS" onclick="NewWishlist.modify('update', '1', '58');">변경</a>
                                </div>
                                <a href="#none" class="close" onclick="$('.optionModify').hide();"><img src="//img.echosting.cafe24.com/skin/base/common/btn_close.gif" alt="닫기"/></a>
                            </div>

                        </li>
</ul>
</td>
                <td class="price">
<strong class="">37,800원<br/></strong><br/><strong class="displaynone">37800</strong>
</td>
                <td><span class="txtInfo"></span></td>
                <td><div class="txtInfo">기본배송<div class="displaynone">(해외배송가능)</div>
</div></td>
                <td>
<span class="">2,500원<br/></span> 조건</td>
                <td class="price">40,300원</td>
                <td class="button">
                    <a href="#none" onclick="NewWishlist.actionOrder('order', 1)" class="btnBasic ">주문하기</a>
                    <a href="#none" onclick="NewWishlist.actionOrder('basket', 1)" class="btnNormal ">장바구니담기</a>
                    <a href="#none" class="btnNormal btn_wishlist_del" rel="58||000A||"><i class="icoDelete"></i> 삭제</a>
                </td>
            </tr>
</tbody>
</table>
<p class="message displaynone">관심상품 내역이 없습니다.</p>
</div>

<div style=" padding:10px 0; border-bottom:1px solid #ddd;" class="xans-element- xans-myshop xans-myshop-wishlistbutton ec-base-button xans-record-"><span class="gLeft">
        <strong class="text">선택상품을</strong>
        <a href="#none" class="btnBasic" onclick="NewWishlist.deleteSelect();"><i class="icoDelete"></i> 삭제하기</a>
        <a href="#none" class="btnNormal" onclick="NewWishlist.basket();">장바구니 담기</a>
    </span>
</div>

<div class="xans-element- xans-myshop xans-myshop-wishlistpaging ec-base-paginate-text"><a href="#none">PREV</a>
<ol>
<li class="xans-record-"><a href="?page=1" class="this">1</a></li>
            </ol>
<a href="#none">NEXT</a>
</div>









<div class="xans-element- xans-order xans-order-totalorder ec-base-button 100per "><ul class="grid2">
<a href="#none" class="btnBlack left sizeL" onclick="Basket.orderAll(this)">전체상품주문</a>
        <a href="#none" class="btnSubmit  right sizeL" onclick="">관심상품 비우기</a>
        </ul>
</div>

</div>   
</div>  




<!-- style="text-transform:uppercase" CEO: {$president_name} . CFO : {$cpo_name} -->
<div id="Footer">
<div class="xans-element- xans-layout xans-layout-footer Footer "><div class="xans-element- xans-layout xans-layout-footer Footer ">
<div class="left">
<ul>
<li>
<a href="https://www.instagram.com/afterblow_official/" target="_blank"><img src="/web/upload/category/editor/2021/12/11/802b1efde8569942d0751ecf29ad95c5.png"/></a>
<a href="https://www.facebook.com/After-blow-109290318265290/?ref=pages_you_manage" target="_blank"><img src="/web/upload/category/editor/2021/12/11/d938ff035e91a5da3a25b4a9309f32b3.png"/></a>
<a href="https://www.youtube.com/channel/UCuTwL0mremND6IzcBQr48Aw" target="_blank"><img src="/web/upload/category/editor/2021/12/11/9c385bdb723221dec6523575ad158588.png"/></a>    
</li>
<li>　</li>
<li><a href="/member/agreement.html">AGREEMENT</a></li>
<li><a href="/shopinfo/guide.html">GUIDE</a></li>
<li><a href="/member/privacy.html">PRIVACY</a></li>
<li><a href="#none" onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=7698601723', 'bizCommPop', 'width=750, height=950;');return false;">[사업자정보확인]</a></li>
</ul>
</div>
<div class="right">
<ul class="box box1">
<li><pre>T. 02-6959-5877
Mon-Fri : 10am - 5pm
Lunch : 12:30pm - 1:30pm
Weekend Holiday OFF

Bank Account
국민 09763704014863
(주)데이지크</pre></li>
</ul>
<ul class="box box2">
<li>
CONTACT<br/><br/>
Email<br/>
byecom@byecom.co.kr<br/><br/>
Address<br/>
06169 Gangnam-gu, Seoul, Korea 4F, 513, Teheran-ro,</li>
</ul>
<ul class="box box3">
<li>
INFO<br/><br/>
Company : (주)데이지크<br/>
CEO : 연정미,이경재<br/><br/>
Business license : 769-86-01723<br/>
Mall-order license : 2020-서울강남-02057<br/>
Copyright © (주)데이지크</li>
</ul>
<ul class="box4">
<a href="#" target="blank">
고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 PG 사의 구매안전서비스를 이용하실 수 있습니다.<br/>
준비중 [서비스 가입사실 확인]
</a> 
</ul>
</div>
</div>
</div>



<div id="btn_right">
<ul><li style="margin-bottom:8px;"><a href="http://pf.kakao.com/_hmZTb" target="blank_"><img src="/web/upload/category/editor/2021/12/11/dea644c78ab5ba82f24fc6f0f90e0928.png" height="30px;"/></a></li>    
<li id="back-top"><a href="#top"><img src="/web/upload/btn/btn_right2.png"/></a></li>
<li id="go-bottom"><b><img src="/web/upload/btn/btn_right3.png"/></b></li>       
</ul></div>



<div id="boxes">
<div id="dialog" class="window">
<!--<a href="#" class="close">Close it</a>-->  

<div id="search_popup">
<div class="title">
 SEARCH  
    </div>
    
<form id="searchBarForm" name="" action="/product/search.html" method="get" target="_self" enctype="multipart/form-data" >
<input id="banner_action" name="banner_action" value="" type="hidden"  /><div class="xans-element- xans-layout xans-layout-searchheader "><!--
$product_page=/product/detail.html
$category_page=/product/list.html
-->
<fieldset>
<legend>검색</legend>    
<input id="keyword" name="keyword" fw-filter="" fw-label="검색어" fw-msg="" class="inputTypeText" placeholder="검색어를 입력해주세요." onmousedown="SEARCH_BANNER.clickSearchForm(this)" value="" type="text"/><input type="image" src="/web/upload/btn/search-search.png" alt="검색" onclick="SEARCH_BANNER.submitSearchBanner(this); return false;"/>       
 </fieldset>
</div>
</form>    
<div class="xans-element- xans-search xans-search-hotkeyword popular"><ul>
<a href="/product/search.html?keyword=" class="xans-record-"></a>
    
<ul></ul>
</ul>
</div>
      
</div>    
</div> 
<div id="mask"></div>
</div>       
</div>
</div>
    

<!-- Google CDN jQuery with fallback to local -->
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.0.min.js"></script>
<script>window.jQuery || document.write('<script src="/web/upload/js/jquery-1.11.0.min.js"><\/script>')</script>

<!-- custom scrollbar plugin -->
<script src="/web/upload/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
(function($){
$(window).on("load",function(){
$("#content-10").mCustomScrollbar({
theme:"minimal"
});   
    
$("#content-2").mCustomScrollbar({
theme:"minimal"
});    
   
});
})(jQuery);
</script>  
    
    

<!-- 결제를 위한 필수 영역 -->
<div id="progressPaybar" style="display:none;">
<div id="progressPaybarBackground" class="layerProgress"></div>
<div id="progressPaybarView">
<div class="box">
<p class="graph">
<span><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/layout/txt_progress.gif" alt="현재 결제가 진행중입니다."/></span>
<span><img src="https://img.echosting.cafe24.com/skin/base/layout/img_loading.gif" alt=""/></span>
</p>
<p class="txt">
본 결제 창은 결제완료 후 자동으로 닫히며,결제 진행 중에 본 결제 창을 닫으시면<br/>
주문이 되지 않으니 결제 완료 될 때 까지 닫지 마시기 바랍니다.
</p>
</div>
</div>
</div>
<!-- // 결제를 위한 필수 영역 -->

<div class="xans-element- xans-layout xans-layout-multishopshipping "><div class="dimmed"></div>
<div class="worldshipLayer ec-base-layer">
<div class="header">
<h3>WORLD SHIPPING</h3>
</div>
<div class="content">
<p class="desc">PLEASE SELECT THE DESTINATION COUNTRY AND LANGUAGE :</p>
<div class="select">
<select class="xans-element- xans-layout xans-layout-multishopshippingcountrylist"><option value="GH"  class="xans-record-">SHIPPING TO : 가나(GHANA)</option>
<option value="GA"  class="xans-record-">SHIPPING TO : 가봉(GABON)</option>
<option value="GY"  class="xans-record-">SHIPPING TO : 가이아나(GUYANA)</option>
<option value="GM"  class="xans-record-">SHIPPING TO : 감비아(GAMBIA)</option>
<option value="GT"  class="xans-record-">SHIPPING TO : 과테말라(GUATEMALA)</option>
<option value="GD"  class="xans-record-">SHIPPING TO : 그레나다(GRENADA)</option>
<option value="GE"  class="xans-record-">SHIPPING TO : 그루지야(GEORGIA)</option>
<option value="GR"  class="xans-record-">SHIPPING TO : 그리스(GREECE)</option>
<option value="GN"  class="xans-record-">SHIPPING TO : 기니(GUINEA)</option>
<option value="GW"  class="xans-record-">SHIPPING TO : 기니비소(GUINEA-BISSAU)</option>
<option value="NA"  class="xans-record-">SHIPPING TO : 나미비아(NAMIBIA)</option>
<option value="NG"  class="xans-record-">SHIPPING TO : 나이지리아(NIGERIA)</option>
<option value="ZA"  class="xans-record-">SHIPPING TO : 남아프리카공화국(SOUTH AFRICA)</option>
<option value="AN"  class="xans-record-">SHIPPING TO : 네덜란드(네덜란드령앤틸리스)(NETHERLANDS(ANTILLES))</option>
<option value="NL"  class="xans-record-">SHIPPING TO : 네덜란드(네델란드)(NETHERLANDS)</option>
<option value="AW"  class="xans-record-">SHIPPING TO : 네덜란드(아루바섬)(ARUBA)</option>
<option value="NP"  class="xans-record-">SHIPPING TO : 네팔(NEPAL)</option>
<option value="NO"  class="xans-record-">SHIPPING TO : 노르웨이(NORWAY)</option>
<option value="NZ"  class="xans-record-">SHIPPING TO : 뉴질란드(NEW ZEALAND)</option>
<option value="NE"  class="xans-record-">SHIPPING TO : 니제르(NIGER)</option>
<option value="NI"  class="xans-record-">SHIPPING TO : 니카라과(NICARAGUA)</option>
<option value="KR"  selected="selected" class="xans-record-">SHIPPING TO : 대한민국(KOREA (REP OF,))</option>
<option value="DK"  class="xans-record-">SHIPPING TO : 덴마크(DENMARK)</option>
<option value="GL"  class="xans-record-">SHIPPING TO : 덴마크(그린란드)(GREENLAND)</option>
<option value="FO"  class="xans-record-">SHIPPING TO : 덴마크(페로즈제도)(FAROE ISLANDS)</option>
<option value="DO"  class="xans-record-">SHIPPING TO : 도미니카공화국(DOMINICAN REPUBLIC)</option>
<option value="DM"  class="xans-record-">SHIPPING TO : 도미니카연방(DOMINICA)</option>
<option value="DE"  class="xans-record-">SHIPPING TO : 독일(GERMANY)</option>
<option value="TL"  class="xans-record-">SHIPPING TO : 동티모르(TIMOR-LESTE)</option>
<option value="LA"  class="xans-record-">SHIPPING TO : 라오스(LAO PEOPLE'S DEM REP)</option>
<option value="LR"  class="xans-record-">SHIPPING TO : 라이베리아(LIBERIA)</option>
<option value="LV"  class="xans-record-">SHIPPING TO : 라트비아(LATVIA)</option>
<option value="RU"  class="xans-record-">SHIPPING TO : 러시아(RUSSIAN FEDERATION)</option>
<option value="LB"  class="xans-record-">SHIPPING TO : 레바논(LEBANON)</option>
<option value="LS"  class="xans-record-">SHIPPING TO : 레소토(LESOTHO)</option>
<option value="RO"  class="xans-record-">SHIPPING TO : 루마니아(ROMANIA)</option>
<option value="LU"  class="xans-record-">SHIPPING TO : 룩셈부르크(LUXEMBOURG)</option>
<option value="RW"  class="xans-record-">SHIPPING TO : 르완다(RWANDA)</option>
<option value="LY"  class="xans-record-">SHIPPING TO : 리비아(LIBYAN ARAB JAMAHIRIYA)</option>
<option value="LI"  class="xans-record-">SHIPPING TO : 리첸쉬테인(LIECHTENSTEIN)</option>
<option value="LT"  class="xans-record-">SHIPPING TO : 리투아니아(LITHUANIA)</option>
<option value="MG"  class="xans-record-">SHIPPING TO : 마다가스카르(MADAGASCAR)</option>
<option value="MK"  class="xans-record-">SHIPPING TO : 마케도니아(MACEDONIA)</option>
<option value="MW"  class="xans-record-">SHIPPING TO : 말라위(MALAWI)</option>
<option value="MY"  class="xans-record-">SHIPPING TO : 말레이지아(MALAYSIA)</option>
<option value="ML"  class="xans-record-">SHIPPING TO : 말리(MALI)</option>
<option value="MX"  class="xans-record-">SHIPPING TO : 멕시코(MEXICO)</option>
<option value="MC"  class="xans-record-">SHIPPING TO : 모나코(MONACO)</option>
<option value="MA"  class="xans-record-">SHIPPING TO : 모로코(MOROCCO)</option>
<option value="MU"  class="xans-record-">SHIPPING TO : 모리셔스(MAURITIUS)</option>
<option value="MR"  class="xans-record-">SHIPPING TO : 모리타니(MAURITANIA)</option>
<option value="MZ"  class="xans-record-">SHIPPING TO : 모잠비크(MOZAMBIQUE)</option>
<option value="ME"  class="xans-record-">SHIPPING TO : 몬테네그로(MONTENEGRO)</option>
<option value="MD"  class="xans-record-">SHIPPING TO : 몰도바(MOLDOVA, REPUBLIC OF)</option>
<option value="MV"  class="xans-record-">SHIPPING TO : 몰디브(MALDIVES)</option>
<option value="MT"  class="xans-record-">SHIPPING TO : 몰타(MALTA)</option>
<option value="MN"  class="xans-record-">SHIPPING TO : 몽고(MONGOLIA)</option>
<option value="US"  class="xans-record-">SHIPPING TO : 미국(U.S.A)</option>
<option value="GU"  class="xans-record-">SHIPPING TO : 미국(괌)(GUAM)</option>
<option value="MH"  class="xans-record-">SHIPPING TO : 미국(마아샬제도)(MARSHALL ISLANDS)</option>
<option value="VI"  class="xans-record-">SHIPPING TO : 미국(버진제도)(VIRGIN ISLANDS U.S.)</option>
<option value="WS"  class="xans-record-">SHIPPING TO : 미국(사모아, 구 서사모아)(SAMOA)</option>
<option value="AS"  class="xans-record-">SHIPPING TO : 미국(사모아제도)(AMERICAN SAMOA)</option>
<option value="MP"  class="xans-record-">SHIPPING TO : 미국(사이판)(NORTHERN MARIANA ISLANDS)</option>
<option value="PW"  class="xans-record-">SHIPPING TO : 미국(팔라우섬)(PALAU)</option>
<option value="PR"  class="xans-record-">SHIPPING TO : 미국(푸에르토리코섬)(PUERTO RICO)</option>
<option value="MM"  class="xans-record-">SHIPPING TO : 미얀마(MYANMAR)</option>
<option value="FM"  class="xans-record-">SHIPPING TO : 미크로네시아(마이크로네시아)(MICRONESIA)</option>
<option value="VU"  class="xans-record-">SHIPPING TO : 바누아투(VANUATU)</option>
<option value="BH"  class="xans-record-">SHIPPING TO : 바레인(BAHRAIN)</option>
<option value="BB"  class="xans-record-">SHIPPING TO : 바베이도스(BARBADOS)</option>
<option value="BS"  class="xans-record-">SHIPPING TO : 바하마(BAHAMAS)</option>
<option value="BD"  class="xans-record-">SHIPPING TO : 방글라데시(BANGLADESH)</option>
<option value="VE"  class="xans-record-">SHIPPING TO : 베네수엘라(VENEZUELA)</option>
<option value="BJ"  class="xans-record-">SHIPPING TO : 베넹(BENIN)</option>
<option value="VN"  class="xans-record-">SHIPPING TO : 베트남(VIET NAM)</option>
<option value="BE"  class="xans-record-">SHIPPING TO : 벨기에(BELGIUM)</option>
<option value="BY"  class="xans-record-">SHIPPING TO : 벨라루스(BELARUS)</option>
<option value="BZ"  class="xans-record-">SHIPPING TO : 벨리세(BELIZE)</option>
<option value="BA"  class="xans-record-">SHIPPING TO : 보스니아헤르체코비나(Bosnia and Herzegovina)</option>
<option value="BW"  class="xans-record-">SHIPPING TO : 보츠와나(BOTSWANA)</option>
<option value="BO"  class="xans-record-">SHIPPING TO : 볼리비아(BOLIVIA)</option>
<option value="BF"  class="xans-record-">SHIPPING TO : 부르키나파소(BURKINA FASO)</option>
<option value="BT"  class="xans-record-">SHIPPING TO : 부탄(BHUTAN)</option>
<option value="BG"  class="xans-record-">SHIPPING TO : 불가리아(BULGARIA(REP))</option>
<option value="BR"  class="xans-record-">SHIPPING TO : 브라질(BRAZIL)</option>
<option value="BN"  class="xans-record-">SHIPPING TO : 브루네이(나이)(BRUNEI DARUSSALAM)</option>
<option value="BI"  class="xans-record-">SHIPPING TO : 브룬디(BURUNDI)</option>
<option value="SA"  class="xans-record-">SHIPPING TO : 사우디아라비아(SAUDI ARABIA)</option>
<option value="CY"  class="xans-record-">SHIPPING TO : 사이프러스(CYPRUS)</option>
<option value="SM"  class="xans-record-">SHIPPING TO : 산마리노(SAN MARINO)</option>
<option value="SN"  class="xans-record-">SHIPPING TO : 세네갈(SENEGAL)</option>
<option value="RS"  class="xans-record-">SHIPPING TO : 세르비아/코소보(SERBIA/KOSOVO)</option>
<option value="SC"  class="xans-record-">SHIPPING TO : 세이셸(SEYCHELLES)</option>
<option value="LC"  class="xans-record-">SHIPPING TO : 세인트 루시아(SAINT LUCIA)</option>
<option value="VC"  class="xans-record-">SHIPPING TO : 세인트빈센트그레나딘(SAINT VINCENT AND THE GRENADINES)</option>
<option value="KN"  class="xans-record-">SHIPPING TO : 세인트키츠네비스(SAINT KITTS AND NEVIS)</option>
<option value="SB"  class="xans-record-">SHIPPING TO : 솔로몬아일란드(SOLOMON ISLANDS)</option>
<option value="SR"  class="xans-record-">SHIPPING TO : 수리남(SURINAME)</option>
<option value="LK"  class="xans-record-">SHIPPING TO : 스리랑카(SRI LANKA)</option>
<option value="SZ"  class="xans-record-">SHIPPING TO : 스와질랜드(SWAZILAND)</option>
<option value="SE"  class="xans-record-">SHIPPING TO : 스웨덴(SWEDEN)</option>
<option value="CH"  class="xans-record-">SHIPPING TO : 스위스(SWITZERLAND)</option>
<option value="ES"  class="xans-record-">SHIPPING TO : 스페인(에스파니아)(SPAIN)</option>
<option value="SK"  class="xans-record-">SHIPPING TO : 슬로바키아(SLOVAKIA)</option>
<option value="SI"  class="xans-record-">SHIPPING TO : 슬로베니아(SLOVENIA)</option>
<option value="SL"  class="xans-record-">SHIPPING TO : 시에라리온(SIERRA LEONE)</option>
<option value="SG"  class="xans-record-">SHIPPING TO : 싱가포르(SINGAPORE)</option>
<option value="AE"  class="xans-record-">SHIPPING TO : 아랍에미레이트연합국(UNITED ARAB EMIRATES)</option>
<option value="AM"  class="xans-record-">SHIPPING TO : 아르메니아(ARMENIA)</option>
<option value="AR"  class="xans-record-">SHIPPING TO : 아르헨티나(ARGENTINA)</option>
<option value="IS"  class="xans-record-">SHIPPING TO : 아이슬란드(ICELAND)</option>
<option value="HT"  class="xans-record-">SHIPPING TO : 아이티(HAITI)</option>
<option value="IE"  class="xans-record-">SHIPPING TO : 아일란드(에이레)(IRELAND)</option>
<option value="AZ"  class="xans-record-">SHIPPING TO : 아제르바이잔(AZERBAIJAN)</option>
<option value="AF"  class="xans-record-">SHIPPING TO : 아프가니스탄(AFGHANISTAN)</option>
<option value="AD"  class="xans-record-">SHIPPING TO : 안도라(ANDORRA)</option>
<option value="AL"  class="xans-record-">SHIPPING TO : 알바니아(ALBANIA)</option>
<option value="DZ"  class="xans-record-">SHIPPING TO : 알제리(ALGERIA)</option>
<option value="AO"  class="xans-record-">SHIPPING TO : 앙골라(ANGOLA)</option>
<option value="AG"  class="xans-record-">SHIPPING TO : 앤티과바부다(ANTIGUA AND BARBUDA)</option>
<option value="ER"  class="xans-record-">SHIPPING TO : 에리트리아(ERITREA)</option>
<option value="EE"  class="xans-record-">SHIPPING TO : 에스토니아(ESTONIA)</option>
<option value="EC"  class="xans-record-">SHIPPING TO : 에콰도르(ECUADOR)</option>
<option value="SV"  class="xans-record-">SHIPPING TO : 엘살바도르(EL SALVADOR)</option>
<option value="GB"  class="xans-record-">SHIPPING TO : 영국(UNITED KINGDOM)</option>
<option value="MS"  class="xans-record-">SHIPPING TO : 영국(몽세라)(MONTSERRAT)</option>
<option value="BM"  class="xans-record-">SHIPPING TO : 영국(버뮤다섬)(BERMUDA)</option>
<option value="VG"  class="xans-record-">SHIPPING TO : 영국(버진제도)(VIRGIN ISLANDS BRITISH)</option>
<option value="AI"  class="xans-record-">SHIPPING TO : 영국(안귈라섬)(ANGUILLA)</option>
<option value="GI"  class="xans-record-">SHIPPING TO : 영국(지브롤터)(GIBRALTAR)</option>
<option value="KY"  class="xans-record-">SHIPPING TO : 영국(케이만제도)(CAYMAN ISLANDS)</option>
<option value="TC"  class="xans-record-">SHIPPING TO : 영국(터크스케이코스제도)(TURKS AND CAICOS ISLANDS)</option>
<option value="YE"  class="xans-record-">SHIPPING TO : 예멘(YEMEN)</option>
<option value="OM"  class="xans-record-">SHIPPING TO : 오만(OMAN)</option>
<option value="NF"  class="xans-record-">SHIPPING TO : 오스트레일리아(노퍽섬)(NORFOLK ISLAND)</option>
<option value="AU"  class="xans-record-">SHIPPING TO : 오스트레일리아(호주)(AUSTRALIA)</option>
<option value="AT"  class="xans-record-">SHIPPING TO : 오스트리아(AUSTRIA)</option>
<option value="HN"  class="xans-record-">SHIPPING TO : 온두라스(HONDURAS)</option>
<option value="JO"  class="xans-record-">SHIPPING TO : 요르단(JORDAN)</option>
<option value="UG"  class="xans-record-">SHIPPING TO : 우간다(UGANDA)</option>
<option value="UY"  class="xans-record-">SHIPPING TO : 우루과이(URUGUAY)</option>
<option value="UZ"  class="xans-record-">SHIPPING TO : 우즈베크(UZBEKISTAN)</option>
<option value="UA"  class="xans-record-">SHIPPING TO : 우크라이나(UKRAINE)</option>
<option value="ET"  class="xans-record-">SHIPPING TO : 이디오피아(ETHIOPIA)</option>
<option value="IQ"  class="xans-record-">SHIPPING TO : 이라크(IRAQ)</option>
<option value="IR"  class="xans-record-">SHIPPING TO : 이란(IRAN(ISLAMIC REP))</option>
<option value="IL"  class="xans-record-">SHIPPING TO : 이스라엘(ISRAEL)</option>
<option value="EG"  class="xans-record-">SHIPPING TO : 이집트(EGYPT)</option>
<option value="IT"  class="xans-record-">SHIPPING TO : 이탈리아(이태리)(ITALY)</option>
<option value="IN"  class="xans-record-">SHIPPING TO : 인도(INDIA)</option>
<option value="ID"  class="xans-record-">SHIPPING TO : 인도네시아(INDONESIA)</option>
<option value="JP"  class="xans-record-">SHIPPING TO : 일본(JAPAN)</option>
<option value="JM"  class="xans-record-">SHIPPING TO : 자메이카(JAMAICA)</option>
<option value="ZM"  class="xans-record-">SHIPPING TO : 잠비아(ZAMBIA)</option>
<option value="CN"  class="xans-record-">SHIPPING TO : 중국(CHINA(PEOPLE'S REP))</option>
<option value="MO"  class="xans-record-">SHIPPING TO : 중국(마카오)(MACAU)</option>
<option value="HK"  class="xans-record-">SHIPPING TO : 중국(홍콩)(HONG KONG)</option>
<option value="CF"  class="xans-record-">SHIPPING TO : 중앙 아프리카(CENTRAL AFRICAN REPUBLIC)</option>
<option value="DJ"  class="xans-record-">SHIPPING TO : 지부티(DJIBOUTI)</option>
<option value="ZW"  class="xans-record-">SHIPPING TO : 짐바브웨(ZIMBABWE)</option>
<option value="TD"  class="xans-record-">SHIPPING TO : 차드(CHAD)</option>
<option value="CZ"  class="xans-record-">SHIPPING TO : 체코(CZECH REP)</option>
<option value="CL"  class="xans-record-">SHIPPING TO : 칠레(CHILE)</option>
<option value="CM"  class="xans-record-">SHIPPING TO : 카메룬(CAMEROON)</option>
<option value="CV"  class="xans-record-">SHIPPING TO : 카보베르데(CAPE VERDE)</option>
<option value="KZ"  class="xans-record-">SHIPPING TO : 카자흐(KAZAKHSTAN)</option>
<option value="QA"  class="xans-record-">SHIPPING TO : 카타르(QATAR)</option>
<option value="KH"  class="xans-record-">SHIPPING TO : 캄보디아(CAMBODIA)</option>
<option value="CA"  class="xans-record-">SHIPPING TO : 캐나다(CANADA)</option>
<option value="KE"  class="xans-record-">SHIPPING TO : 케냐(KENYA)</option>
<option value="CR"  class="xans-record-">SHIPPING TO : 코스타리카(COSTA RICA)</option>
<option value="CI"  class="xans-record-">SHIPPING TO : 코트디봐르(COTE D IVOIRE)</option>
<option value="CO"  class="xans-record-">SHIPPING TO : 콜롬비아(COLOMBIA)</option>
<option value="CG"  class="xans-record-">SHIPPING TO : 콩고(CONGO)</option>
<option value="CU"  class="xans-record-">SHIPPING TO : 쿠바(CUBA)</option>
<option value="KW"  class="xans-record-">SHIPPING TO : 쿠웨이트(KUWAIT)</option>
<option value="HR"  class="xans-record-">SHIPPING TO : 크로아티아(CROATIA)</option>
<option value="KG"  class="xans-record-">SHIPPING TO : 키르키즈스탄(KYRGYZSTAN)</option>
<option value="KI"  class="xans-record-">SHIPPING TO : 키리바티(KIRIBATI)</option>
<option value="TH"  class="xans-record-">SHIPPING TO : 타이(태국)(THAILAND)</option>
<option value="TW"  class="xans-record-">SHIPPING TO : 타이완(대만)(TAIWAN)</option>
<option value="TJ"  class="xans-record-">SHIPPING TO : 타지키스탄(TAJIKISTAN)</option>
<option value="TZ"  class="xans-record-">SHIPPING TO : 탄자니아(TANZANIA(UNITED REP))</option>
<option value="TR"  class="xans-record-">SHIPPING TO : 터키(TURKEY)</option>
<option value="TG"  class="xans-record-">SHIPPING TO : 토고(TOGO)</option>
<option value="TO"  class="xans-record-">SHIPPING TO : 통가(TONGA)</option>
<option value="TM"  class="xans-record-">SHIPPING TO : 투르크메니스탄(TURKMENISTAN)</option>
<option value="TV"  class="xans-record-">SHIPPING TO : 투발루(TUVALU)</option>
<option value="TN"  class="xans-record-">SHIPPING TO : 튀니지(TUNISIA)</option>
<option value="TT"  class="xans-record-">SHIPPING TO : 트리니다드토바고(TRINIDAD AND TOBAGO)</option>
<option value="PA"  class="xans-record-">SHIPPING TO : 파나마(PANAMA(REP))</option>
<option value="PY"  class="xans-record-">SHIPPING TO : 파라과이(PARAGUAY)</option>
<option value="PK"  class="xans-record-">SHIPPING TO : 파키스탄(PAKISTAN)</option>
<option value="PG"  class="xans-record-">SHIPPING TO : 파푸아뉴기니(PAPUA NEW GUINEA)</option>
<option value="PE"  class="xans-record-">SHIPPING TO : 페루(PERU)</option>
<option value="PT"  class="xans-record-">SHIPPING TO : 포르투갈(PORTUGAL)</option>
<option value="PL"  class="xans-record-">SHIPPING TO : 폴란드(POLAND(REP))</option>
<option value="FR"  class="xans-record-">SHIPPING TO : 프랑스(FRANCE)</option>
<option value="GP"  class="xans-record-">SHIPPING TO : 프랑스(과데루프섬)(GUADELOUPE)</option>
<option value="GF"  class="xans-record-">SHIPPING TO : 프랑스(기아나)(FRENCH GUIANA)</option>
<option value="NC"  class="xans-record-">SHIPPING TO : 프랑스(뉴칼레도니아섬)(NEW CALEDONIA)</option>
<option value="RE"  class="xans-record-">SHIPPING TO : 프랑스(레위니옹섬)(REUNION)</option>
<option value="MQ"  class="xans-record-">SHIPPING TO : 프랑스(마르티니크섬)(MARTINIQUE)</option>
<option value="PF"  class="xans-record-">SHIPPING TO : 프랑스(폴리네시아)(FRENCH POLYNESIA)</option>
<option value="FJ"  class="xans-record-">SHIPPING TO : 피지(FIJI)</option>
<option value="FI"  class="xans-record-">SHIPPING TO : 필란드(FINLAND)</option>
<option value="PH"  class="xans-record-">SHIPPING TO : 필리핀(PHILIPPINES)</option>
<option value="HU"  class="xans-record-">SHIPPING TO : 헝가리(HUNGARY(REP))</option>
</select>
</div>
<div class="select">
<select class="xans-element- xans-layout xans-layout-multishopshippinglanguagelist"><option value="afterblow-scent.com"  selected="selected" class="xans-record-">LANGUAGE : 한국어</option>
<option value="afterblow.cafe24.com/shop2"  class="xans-record-">LANGUAGE : 日本語</option>
</select>
</div>
</div>
<div class="ec-base-button">
<a href="#none"><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/link/btn_go.gif" alt="GO"/></a>
</div>
<a href="#none" class="close"><img src="https://img.echosting.cafe24.com/skin/base/common/btn_close.gif" width="13" height="13" alt="close"/></a>
</div>
</div>



</div><script type="text/javascript">var sAuthSSLDomain = "https://login2.cafe24ssl.com";</script><script type="text/javascript" src="https://login2.cafe24ssl.com/crypt/AuthSSLManager.js"></script><script type="text/javascript" src="https://login2.cafe24ssl.com/crypt/AuthSSLManager.plugin.js"></script>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-T3T7VL8"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- cre.ma / 리뷰 초기화 / 스크립트를 수정할 경우 연락주세요 (support@cre.ma) / 2022-01-12 10:13:28 +0900 -->
<script>(function(i,s,o,g,r,a,m){if(s.getElementById(g)){return};a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.id=g;a.async=1;a.src=r;m.parentNode.insertBefore(a,m)})(window,document,'script','crema-jssdk','//widgets.cre.ma/afterblow-scent.com/init.js');</script>
<span itemscope="" itemtype="https://schema.org/Organization">
<link itemprop="url" href="https://afterblow-scent.com">
</span>

                <script>
                try {
                    // Account ID 적용
                    if (!wcs_add) var wcs_add = {};
                    wcs_add["wa"] = "s_59479b4d5d8b";
            
                    // 마일리지 White list가 있을 경우
                    wcs.mileageWhitelist = ["afterblow.cafe24.com", "www.afterblow.cafe24.com", "m.afterblow.cafe24.com", "afterblow-scent.com", "www.afterblow-scent.com", "m.afterblow-scent.com"];

                    // 네이버 페이 White list가 있을 경우
                    wcs.checkoutWhitelist = ["afterblow.cafe24.com", "www.afterblow.cafe24.com", "m.afterblow.cafe24.com", "afterblow-scent.com", "www.afterblow-scent.com", "m.afterblow-scent.com"];
                
                    // 레퍼러 (스크립트 인젠션 공격 대응 strip_tags) ECQAINT-15101
                    wcs.setReferer("");

                    // 유입 추적 함수 호출
                    wcs.inflow("afterblow-scent.com");

                    // 로그수집
                    wcs_do();
                } catch (e) {};
                </script>
            

<!-- External Script Start -->

<!-- fbe -->
<!-- CMC3 script -->
<div id="fbe_common_top_script" style="display:none;">
  <script type="text/javascript">
if(! window.top.fbe_init_activated) {
  !function(){
    function get_cookie(name) {
      return (name = (document.cookie + ';').match(name + '=.*;')) && name[0].split(/=|;/)[1];
    }
    function get_external_id(){
      return get_cookie('fb_external_id');
    }
  
    !function(f,b,e,v,n,t,s)
    {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
    n.callMethod.apply(n,arguments):n.queue.push(arguments)};
    if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
    n.queue=[];t=b.createElement(e);t.async=!0;
    t.src=v;s=b.getElementsByTagName(e)[0];
    s.parentNode.insertBefore(t,s)}(window, document,'script',
    'https://connect.facebook.net/en_US/fbevents.js');
    if ((typeof EC_GLOBAL_INFO !== 'undefined' && EC_GLOBAL_INFO.getCountryCode() == 'US') || (typeof SHOP !== 'undefined' && SHOP.getLanguage() == 'en_US')) {
        fbq('dataProcessingOptions', ['LDU'], 0, 0);
    }
    if (typeof ECLOG !== 'undefined') {
        ECLOG.EXTERNAL_ID.chk(CAFE24.SHOP.getMallID() + '.' + CAFE24.SDE_SHOP_NUM, function(error, value) {
            fbq('init', '3106559256268506',{external_id: value}, {agent: 'plcafe24'});
            fbq('trackSingle', '3106559256268506', 'PageView');
        });
    } else {
        fbq('init', '3106559256268506',{external_id: get_external_id()}, {agent: 'plcafe24'});
        fbq('trackSingle', '3106559256268506', 'PageView');
    }
  }();
  window.top.fbe_init_activated = true;
}
</script>
<noscript><img height="1" width="1" style="display:none"
  src="https://www.facebook.com/tr?id=3106559256268506&ev=PageView&noscript=1"
/></noscript>
</div>
<!-- CMC3 script -->

<!-- gcs -->
<!-- Global site tag (gtag.js) - Google Ads: 10831905478 -->
<script async src="https://www.googletagmanager.com/gtag/js?id=AW-10831905478"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'AW-10831905478');
</script>


<script>
  gtag('event', 'conversion', {
      'send_to': 'AW-10831905478/MS0nCLLWv40DEMaFh60o',
      'value': 0.0,
  });
</script>
<!-- kmp -->
<!-- CMC3 script -->
<div id="kmp_common_top_script" style="display:none;">
<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
<script type="text/javascript">
  kakaoPixel('6937314121891888687').pageView();
  kakaoPixel.setServiceOrigin('20001');
</script>

</div>
<!-- CMC3 script -->
 
<!-- External Script End -->

<script type="text/javascript" src="//t1.daumcdn.net/adfit/static/kp.js" charset="utf-8"></script>
<script type="text/javascript" src="//developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/ind-script/i18n.php?lang=ko_KR&domain=front&v=2310111247" charset="utf-8"></script>

<script src="/ind-script/optimizer.php?filename=zVlbU-M2FH4Hv_Z3uLSdTl8hWVpmoTCEXZ5l-TgRlnVUXQjeX99jJ6GbBd8kM9NhcGJF36cj6VyldIMVpGe_mLQwrIItmjI1YNEbDumTTcXZHyp5sj-lff280IyX6dM_Hky9__g1-T35eSISXhwYxaTdNyQcsRQQy-KNDJpCAjwpVDBUIUdVSMFdEMVZ8hv9BQ1Ovzo0P6ybNrgm_NHu5syBE9Shol7KpcBv2i-Pwm0evi2ZY0kl1AQeKTJCwQN9H0ZZbYRyxQh65L4R6xJNtUDlDEoJZhh3J7091_rCiHw9Qh7vhBzuVRhsV-rEoiQEqhOH-kQKBScZU2qMXDsKjlWFamzvF6bIGhWptjbgxo_S4hxUWtK-vA9iWqc3mAkJ6f13-J18PavSgasw99Rkt0JPG7DwijcL2vTLPZlN1anEYxl6hCBVTb_srOd7Csm-1RJZPglUeceacW8zC-a5a3M6wBplXQg5WvVyKJiXrlkCWzHjLnq0rum02qA-GvCypfnMSoZp2TzvxAvIPivpoVm0WvKlV0k6oEvI_Hr6gKTHazT1tbBuMvgeCjCgOCy8aT7rOyN4z6QvkJn8iIdak6xpjY1K2Vq0oP9HjMzJYytLKmxjmYBZodaxLBU4ljfxZ-oO_w3bA8eT7XKvE_BMCmaDWOj_VqoyCHvwX9vKJhTLeUlP5nyYILe69YmfXpxhrVTte_u6Qpmjd3PTDlhVGOlVxdazky6FpchYC4qQM1JfEd2KrEDCCiS0IWl-wQ0RXzBbwuzbd-lV_saG42kfqyj9fSVb9CROk6nUPDJdCJXPQrQMdXo_En0lz5WzbtXryEYOgTG1NNSp7jbkUXi-fzstKHVnLlaSuWh8SLqy9-mPwm5kSO6xx9_tXPsl5a67jbphihybmY0vkuicx5AcVmcV4JUOM6EkPnIO1_H7E-hksjCHvPPjq2AkVbmTkYSh6MfRKxeCXTApMzK26Qn8pilYptufBWb4ZpLtO1YU9dsjjMF0VEu_FlQ3P-98KJpDSvja8F5eGEDb5L0qt2_piUFTbIKPG2EDUsOHz4P2On9zVjPnAFRti6L-OH6qzN1syySRMwlpicO1_n8SdB-AtIHjSOG3kElcD7NvXCVBOeEE2OHeC1Nrh5-hniQLs7Xiu2cwroIqAxMMvzU5GN7n3wYIdt41nkH3F0SjOPaBKZhlgZ5cSsxcbijH6K3BBvBL0GhF-PhNctEf2kcQDAS8AQYquiACft_CS6jJb-SRLA_omFxEzaa1j3C1BAWFiDWNa1ZHyPCnYXm4Qp57h1RPCN7SUN6xDbcNL524Q-11OEV9LUp4zT9jNvaIKspkrsUzSKHKvlx4jJb9JZo7qXoGfd0zPbBsFp7mrCZqhVqyJTgm5JUqMNw_SyYqlkmIkEgztzEo4TQsfTja-M5LkA6wDohPu_h-SjmLmKZfdptQKiX7PMen_Zny8Q1RW0rQz5Ybod1EdHPN0dQ-6UoDby_jCtYX198lOXJAVEeNvAY06B1cihfq-S8&type=js&k=6aea9ed1aa2db78d7a898bb08060f9ca0b79d5da&t=1696906972" ></script><script src="/ind-script/optimizer_user.php?filename=pdA7EsIwDEXRHtOyDjXshBX4I2IltiUiiwy7JzBDQRt3rzpz50HmioDRmeKq4O8d11B4A7FQKLrcawFN6BIqTQ10oXaFWSGjT7ieZ73AIaL4F1uH4JXix_uO49wuRK6V2xBROVnBX9vDKC7uSbgNoRpPnWWI8GHvccJiY8648P9QtdJJM8stkwi1abff&type=js&k=d2f9a4f010778d7b5e518540a7736f3e7a4b8a5d&t=1641127811&user=T" ></script>
<script type="text/javascript">
var currentPageURL = window.location.href;
var targetPagePaths = ['/order/basket_channel.html','/order/orderform_channel.html','/order/order_result_channel.html','/product/detail_channel.html'];
var targetPageParameter = 'ch_ref';
var sUseShoppingpayPg = 'F';
if (targetPagePaths.some(function(path) { return currentPageURL.includes(path); })) {
var urlParams = new URLSearchParams(window.location.search);
var sChRef = urlParams.get(targetPageParameter);
sessionStorage.setItem('ch_ref', sChRef);
}
CAFE24.getChRefData = function() {
if (targetPagePaths.some(function(path) { return currentPageURL.includes(path); })) {
return sessionStorage.getItem('ch_ref');
}
}
CAFE24.checkChannelUI = function() {
if (targetPagePaths.some(function(path) { return currentPageURL.includes(path); }) && sessionStorage.getItem('ch_ref')) {
return true;
} else {
return false;
}
}
CAFE24.attachChRef = function(sUrl) {
if (sUrl) {
var sChRef = CAFE24.getChRefData();
if (sChRef) {
var sSeparator = (sUrl.includes('?')) ? '&' : '?';
sUrl += sSeparator + 'ch_ref=' + sChRef;
}
}
return sUrl;
};
CAFE24.MOBILE_WEB = false; var mobileWeb = CAFE24.MOBILE_WEB;
try {
var isUseLoginKeepingSubmit = false;
// isSeqNoKeyExpiretime
function isSeqNoKeyExpiretime(iExpiretime)
{
var sDate = new Date();
var iNow = Math.floor(sDate.getTime() / 1000);
// 유효시간 확인
if (iExpiretime > iNow) {
return false;
}
return true;
}
function isUseLoginKeeping()
{
// 디바이스 확인
if (EC_MOBILE_DEVICE === false) {
return;
}
// 로그인 여부
if (sessionStorage.getItem('member_' + CAFE24.SDE_SHOP_NUM) !== null) {
return;
}
var sLoginKeepingInfo = localStorage.getItem('use_login_keeping_info');
var iSeqnoExpiretime;
var iSeqNoKey;
if (sLoginKeepingInfo == null) {
iSeqnoExpiretime = localStorage.getItem('seq_no_key_expiretime');
iSeqNoKey = localStorage.getItem('seq_no_key');
// 유효시간, key 값 확인
if (iSeqnoExpiretime === null || iSeqNoKey === null) {
return;
}
} else {
var oLoginKeepingInfo = JSON.parse(sLoginKeepingInfo);
iSeqNoKey = oLoginKeepingInfo.seq_no_key;
iSeqnoExpiretime = oLoginKeepingInfo.seq_no_key_expiretime;
if (isNaN(iSeqNoKey) === true || isNaN(iSeqnoExpiretime) === true) {
return;
}
}
if (isSeqNoKeyExpiretime(iSeqnoExpiretime) === false) {
return;
}
useLoginKeepingSubmit();
}
function findGetParamValue(paramKey)
{
var result = null,
tmp = [];
location.search.substr(1).split('&').forEach(function (item) {
tmp = item.split('=');
if (tmp[0] === paramKey) result = decodeURIComponent(tmp[1]);
});
return result;
}
function useLoginKeepingSubmit()
{
var iSeqnoExpiretime;
var iSeqNoKey;
var sUseLoginKeepingIp;
var sLoginKeepingInfo = localStorage.getItem('use_login_keeping_info');
if (sLoginKeepingInfo == null) {
iSeqnoExpiretime = localStorage.getItem('seq_no_key_expiretime');
iSeqNoKey = localStorage.getItem('seq_no_key');
} else {
var oLoginKeepingInfo = JSON.parse(sLoginKeepingInfo);
iSeqNoKey = oLoginKeepingInfo.seq_no_key;
iSeqnoExpiretime = oLoginKeepingInfo.seq_no_key_expiretime;
sUseLoginKeepingIp = oLoginKeepingInfo.use_login_keeping_ip;
}
var oForm = document.createElement('form');
oForm.method = 'post';
oForm.action = '/exec/front/member/LoginKeeping';
document.body.appendChild(oForm);
var oSeqNoObj = document.createElement('input');
oSeqNoObj.name = 'seq_no_key';
oSeqNoObj.type = 'hidden';
oSeqNoObj.value = iSeqNoKey;
oForm.appendChild(oSeqNoObj);
oSeqNoObj = document.createElement('input');
oSeqNoObj.name = 'seq_no_key_expiretime';
oSeqNoObj.type = 'hidden';
oSeqNoObj.value = iSeqnoExpiretime;
oForm.appendChild(oSeqNoObj);
var returnUrl = findGetParamValue('returnUrl');
if (returnUrl == '' || returnUrl == null) {
returnUrl = location.pathname + location.search;
}
oSeqNoObj = document.createElement('input');
oSeqNoObj.name = 'returnUrl';
oSeqNoObj.type = 'hidden';
oSeqNoObj.value = returnUrl;
oForm.appendChild(oSeqNoObj);
if (sUseLoginKeepingIp != undefined) {
oSeqNoObj = document.createElement('input');
oSeqNoObj.name = 'use_login_keeping_ip';
oSeqNoObj.type = 'hidden';
oSeqNoObj.value = sUseLoginKeepingIp;
oForm.appendChild(oSeqNoObj);
}
oForm.submit();
isUseLoginKeepingSubmit = true;
}
isUseLoginKeeping();
} catch(e) {
}
CAFE24.KAKAO_PIXEL_BRIDGE.init("6937314121891888687");
CAFE24.KAKAO_PIXEL_BRIDGE.init("6937314121891888687");
CAFE24.KAKAO_PIXEL_BRIDGE.init("6937314121891888687");
CAFE24.SHOP_CURRENCY_INFO = {"1":{"aShopCurrencyInfo":{"currency_code":"KRW","currency_no":"410","currency_symbol":"\uffe6","currency_name":"South Korean won","currency_desc":"\uffe6 \uc6d0 (\ud55c\uad6d)","decimal_place":0,"round_method_type":"F"},"aShopSubCurrencyInfo":null,"aBaseCurrencyInfo":{"currency_code":"KRW","currency_no":"410","currency_symbol":"\uffe6","currency_name":"South Korean won","currency_desc":"\uffe6 \uc6d0 (\ud55c\uad6d)","decimal_place":0,"round_method_type":"F"},"fExchangeRate":1,"fExchangeSubRate":null,"aFrontCurrencyFormat":{"head":"","tail":"\uc6d0"},"aFrontSubCurrencyFormat":{"head":"","tail":""}}}; var SHOP_CURRENCY_INFO = CAFE24.SHOP_CURRENCY_INFO;
if (typeof CAFE24.SHOP_FRONT_NEW_OPTION_COMMON !== "undefined") {CAFE24.SHOP_FRONT_NEW_OPTION_COMMON.initObject();}
if (typeof CAFE24.SHOP_FRONT_NEW_OPTION_BIND !== "undefined") {CAFE24.SHOP_FRONT_NEW_OPTION_BIND.initChooseBox();}
if (typeof CAFE24.SHOP_FRONT_NEW_OPTION_DATA !== "undefined") {CAFE24.SHOP_FRONT_NEW_OPTION_DATA.initData();}
var sViewWishListBasket = "F"
var sWishUrl = "/exec/front/Product/Wishlist/"
var sBlackType = ""
var set_option = {"setproduct_require":"setproduct_require","setproduct_option":"setproduct_option","setproduct_add_option":"setproduct_add_option","addproduct_option":"addproduct_option","addproduct_add_option":"addproduct_add_option","code_setproduct":"setproduct","code_addproduct":"addproduct"};
var sOptionType44="";
var sProductCode44="";
var aProductMax44={"product_max":0,"product_max_type":"F"};
var sItemCode44 = 'P00000BS000C';
var item_listing_type0 = 'C';
var sOptionType58="";
var sProductCode58="";
var aProductMax58={"product_max":0,"product_max_type":"F"};
var sItemCode58 = 'P00000CG000A';
var item_listing_type1 = 'C';
var aWishlistProductData = [];
aWishlistProductData[0] = {"wish_list_idx":157,"has_option":"F","is_soldout":"F","is_reserve_stat":"N","enable_order":true,"enable_purchase":"T","buy_limit_type":"F","product_no":44,"product_name":"\uc624 \ub4dc \ud37c\ud4f8 01 \ud150\ub354 \uc6b0\ub4dc 25ml","opt_id":"000C","opt_add":"","opt_add_params":"option_add[]=","opt_add_params_org":[null],"delvtype":"A","option_type":"T","main_cate_no":24,"display_group":0,"basket_type":"A0000","product_code":"P00000BS","is_set_product":"F","set_product_type":"C","set_product_list":null,"item_code":"P00000BS000C","add_option_name":"","add_option_name_org":"","quantity":1,"is_able_oversea":"F","basket_selected_item":"","basket_save_data":"","product_price_type":"F","option_attached_file_info_json":"","set_product_no":0,"set_product_code":null,"set_product_name":"","is_regular_delivery":false,"old_act_basket":"EC_Wishlist.PrepareBasket('44','24','','A0000','0','1','T','T','000C','P00000BS000C','P00000BS','');","old_act_order":"EC_Wishlist.PrepareBasket('44','24','','A0000','0','1','','T','000C','P00000BS000C','P00000BS','');","is_exclusive_purchase_only":false}
aWishlistProductData[1] = {"wish_list_idx":156,"has_option":"F","is_soldout":"F","is_reserve_stat":"N","enable_order":true,"enable_purchase":"T","buy_limit_type":"F","product_no":58,"product_name":"\uc624 \ub4dc \ud37c\ud4f8 05 \ub85c\uc988 \ubd80\ucf00 25ml","opt_id":"000A","opt_add":"","opt_add_params":"option_add[]=","opt_add_params_org":[null],"delvtype":"A","option_type":"T","main_cate_no":24,"display_group":0,"basket_type":"A0000","product_code":"P00000CG","is_set_product":"F","set_product_type":"C","set_product_list":null,"item_code":"P00000CG000A","add_option_name":"","add_option_name_org":"","quantity":1,"is_able_oversea":"F","basket_selected_item":"","basket_save_data":"","product_price_type":"F","option_attached_file_info_json":"","set_product_no":0,"set_product_code":null,"set_product_name":"","is_regular_delivery":false,"old_act_basket":"EC_Wishlist.PrepareBasket('58','24','','A0000','1','1','T','T','000A','P00000CG000A','P00000CG','');","old_act_order":"EC_Wishlist.PrepareBasket('58','24','','A0000','1','1','','T','000A','P00000CG000A','P00000CG','');","is_exclusive_purchase_only":false}
var aWishProductSetData = [];
CAFE24.KAKAO_PIXEL_BRIDGE.init("6937314121891888687");
CAFE24.KAKAO_PIXEL_BRIDGE.init("6937314121891888687");
CAFE24.KAKAO_PIXEL_BRIDGE.init("6937314121891888687");
var EC_BASKET_BENEFIT_INFO = '{"total_benefit_price_raw":null,"aBenefit":{"total_subscriptionpayseqsale_price":null,"total_periodsale_price":null,"total_membersale_price":null,"total_rebuysale_price":null,"total_bulksale_price":null,"total_newproductsale_price":null,"total_membergroupsale_price":null,"total_setproductsale_price":null,"total_shipfeesale_price":null}}'
var EC_SHOP_FRONT_BASKET_DELETED_PRODUCT = [];
var aBasketProductData = [];
var sBasketDelvType = 'A';
var bIsNewProduct = true;
var sUseBasketConfirm = 'F';
var sUsePaymentMethodPerProduct = 'F';
var sDiscountApp = "";
var bCheckedProductCalc = false;
CAFE24.KAKAO_PIXEL_BRIDGE.init("6937314121891888687");
var bUseElastic = false;
var sSearchBannerUseFlag = 'F';
CAFE24.KAKAO_PIXEL_BRIDGE.init("6937314121891888687");
CAFE24.KAKAO_PIXEL_BRIDGE.init("6937314121891888687");
var EC_SHOP_MULTISHOP_SHIPPING = {"bMultishopShipping":false,"bMultishopShippingCountrySelection":false,"bMultishopShippingLanguageSelection":false};
CAFE24.KAKAO_PIXEL_BRIDGE.init("6937314121891888687");
CAFE24.KAKAO_PIXEL_BRIDGE.init("6937314121891888687");
var aLogData = {"log_server1":"eclog2-225.cafe24.com","log_server2":"elg-db-svcm-279.cafe24.com","mid":"afterblow","stype":"e","domain":"","shop_no":1,"lang":"ko_KR","ver":2,"hash":"370b42087a2550071670a3bc33a72cfe","ca":"cfa-js.cafe24.com\/cfa.js","etc":"","mobile_flag":"F"};
var sMileageName = '적립금';
var sMileageUnit = '[:PRICE:]원';
var sDepositName = '예치금';
var sDepositUnit = '원';
var EC_ASYNC_LIVELINKON_ID = '';
if (EC$('[async_section=before]').length > 0) {
EC$('[async_section=before]').addClass('displaynone');
}
CAFE24.APPSCRIPT_ASSIGN_DATA = CAFE24.APPSCRIPT_ASSIGN_DATA || [{'src':'https://widgets.cre.ma/cafe24/init.js?vs=20220112101940.1&client_id=SdksuzSDEpyhy6OLNQpKXC', 'integrity': 'sha384-WDAJpSw3zUhpJD5ZenKaoJ5rcaUpCGj02Qgj7ZL2wzXbp+GRRDZgJIpeGnZxE4GF'},{'src':'https://saladlab.s3.ap-northeast-2.amazonaws.com/js/widget.js?vs=20230118103550.1&client_id=tgHZp6LCG5KuklqvIYgrtB'},{'src':'https://saladlab.s3.ap-northeast-2.amazonaws.com/js/review_count.js?vs=20230118103551.1&client_id=tgHZp6LCG5KuklqvIYgrtB'},{'src':'https://saladlab.s3.ap-northeast-2.amazonaws.com/js/alphareview_GA.js?vs=20230118103551.1&client_id=tgHZp6LCG5KuklqvIYgrtB'},{'src':'https://saladlab.s3.ap-northeast-2.amazonaws.com/js/briefing_widget.js?vs=20230118103551.1&client_id=tgHZp6LCG5KuklqvIYgrtB'},{'src':'https://saladlab.s3.ap-northeast-2.amazonaws.com/js/login_popup.js?vs=20230307182540.1&client_id=tgHZp6LCG5KuklqvIYgrtB'},{'src':'https://alphaupsell.s3.ap-northeast-2.amazonaws.com/js/alphaupsell_GA.js?vs=20230206103028.1&client_id=jN5seFcsYCzJn1XwxiPM9B'},{'src':'https://alphaupsell.s3.ap-northeast-2.amazonaws.com/js/alphaupsell_log.js?vs=20230206103028.1&client_id=jN5seFcsYCzJn1XwxiPM9B'}];
CAFE24.APPSCRIPT_SDK_DATA = CAFE24.APPSCRIPT_SDK_DATA || ['application','order','store','product','community','customer','collection','supply','promotion','shipping','category','mileage','personal','privacy','salesreport'];
var EC_APPSCRIPT_ASSIGN_DATA = CAFE24.getDeprecatedNamespace('EC_APPSCRIPT_ASSIGN_DATA');
var EC_APPSCRIPT_SDK_DATA = CAFE24.getDeprecatedNamespace('EC_APPSCRIPT_SDK_DATA');
</script></body></html>

</body>
</html>