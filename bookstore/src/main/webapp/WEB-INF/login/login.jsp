<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-04-25
  Time: 오후 6:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">

    <link rel="stylesheet" href="/resources/css/style.css">
    <title>Login #9</title>
    <script nonce="527f5118-0b83-4ded-83c4-52d880cabcd3">try{(function(w,d){!function(ng,nh,ni,nj){ng[ni]=ng[ni]||{};ng[ni].executed=[];ng.zaraz={deferred:[],listeners:[]};ng.zaraz._v="5594";ng.zaraz.q=[];ng.zaraz._f=function(nk){return async function(){var nl=Array.prototype.slice.call(arguments);ng.zaraz.q.push({m:nk,a:nl})}};for(const nm of["track","set","debug"])ng.zaraz[nm]=ng.zaraz._f(nm);ng.zaraz.init=()=>{var nn=nh.getElementsByTagName(nj)[0],no=nh.createElement(nj),np=nh.getElementsByTagName("title")[0];np&&(ng[ni].t=nh.getElementsByTagName("title")[0].text);ng[ni].x=Math.random();ng[ni].w=ng.screen.width;ng[ni].h=ng.screen.height;ng[ni].j=ng.innerHeight;ng[ni].e=ng.innerWidth;ng[ni].l=ng.location.href;ng[ni].r=nh.referrer;ng[ni].k=ng.screen.colorDepth;ng[ni].n=nh.characterSet;ng[ni].o=(new Date).getTimezoneOffset();if(ng.dataLayer)for(const nt of Object.entries(Object.entries(dataLayer).reduce(((nu,nv)=>({...nu[1],...nv[1]})),{})))zaraz.set(nt[0],nt[1],{scope:"page"});ng[ni].q=[];for(;ng.zaraz.q.length;){const nw=ng.zaraz.q.shift();ng[ni].q.push(nw)}no.defer=!0;for(const nx of[localStorage,sessionStorage])Object.keys(nx||{}).filter((nz=>nz.startsWith("_zaraz_"))).forEach((ny=>{try{ng[ni]["z_"+ny.slice(7)]=JSON.parse(nx.getItem(ny))}catch{ng[ni]["z_"+ny.slice(7)]=nx.getItem(ny)}}));no.referrerPolicy="origin";no.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(ng[ni])));nn.parentNode.insertBefore(no,nn)};["complete","interactive"].includes(nh.readyState)?zaraz.init():ng.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,"zarazData","script");})(window,document)}catch(e){throw fetch("/cdn-cgi/zaraz/t"),e;};</script>
</head>
<body>
<div class="content">
    <div class="container">
        <div class="row justify-content-center">

            <div class="col-md-6 contents">
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <div class="form-block">
                            <div class="mb-4">
                                <h3>Sign In to <strong>Colorlib</strong></h3>
                                <p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p>
                            </div>
                            <form action="#" method="post">
                                <div class="form-group first">
                                    <label for="username">Username</label>
                                    <input type="text" class="form-control" id="username">
                                </div>
                                <div class="form-group last mb-4">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password">
                                </div>
                                <div class="d-flex mb-5 align-items-center">
                                    <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                                        <input type="checkbox" checked="checked" />
                                        <div class="control__indicator"></div>
                                    </label>
                                    <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span>
                                </div>
                                <input type="submit" value="Log In" class="btn btn-pill text-white btn-block btn-primary">
                                <span class="d-block text-center my-4 text-muted"> or sign in with</span>
                                <div class="social-login text-center">
                                    <a href="#" class="facebook">
                                        <span class="icon-facebook mr-3"></span>
                                    </a>
                                    <a href="#" class="twitter">
                                        <span class="icon-twitter mr-3"></span>
                                    </a>
                                    <a href="#" class="google">
                                        <span class="icon-google mr-3"></span>
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/main.js"></script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v55bfa2fee65d44688e90c00735ed189a1713218998793" integrity="sha512-FIKRFRxgD20moAo96hkZQy/5QojZDAbyx0mQ17jEGHCJc/vi0G2HXLtofwD7Q3NmivvP9at5EVgbRqOaOQb+Rg==" data-cf-beacon='{"rayId":"879d448bbc1a29e5","version":"2024.4.0","token":"cd0b4b3a733644fc843ef0b185f98241"}' crossorigin="anonymous"></script>
</body>
</html>
