﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carousel.aspx.cs" Inherits="ZoomLaCMS.Design.SPage.Edit.Carousel" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>轮播图</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div ng-app="APP" ng-controller="ZLCtrl">
  <%--   <ul class="nav nav-tabs">
    <li class="active"><a href="#Tabs0" data-toggle="tab">内容设置</a></li>
   <li><a href="#Tabs1" data-toggle="tab">显示设置</a></li>
</ul>  --%>
<div class="tab-content">
    <div class="tab-pane active" id="Tabs0">
        <table class="table table-bordered">
            <tr ng-repeat="item in list|orderBy:'order' track by $index">
                <td><img ng-src="{{item.src}}" class="thumbimg" title="点击上传" ng-click="upimg(item);"/></td>
                <td><input type="text" ng-model="item.url" class="form-control"/></td>
                <td>
        <%--            <button type="button" class="btn btn-info" ng-click="move(item,'pre');"><i class="fa fa-chevron-up"></i></button>
                    <button type="button" class="btn btn-info" ng-click="move(item,'next');"><i class="fa fa-chevron-down"></i></button>--%>
                    <button type="button" class="btn btn-info" ng-click="del(item);"><i class="fa fa-trash-o"></i></button>
                </td>
            </tr>
            <tr><td colspan="3" class="text-center">
                <button type="button" ng-click="add();" class="btn btn-info margin_l5">新加一行</button>
                <input type="button" value="保存信息" ng-click="save();" class="btn btn-info" />
            </td></tr>
        </table>
    </div>
    <div class="tab-pane" id="Tabs1">
        <table class="table table-bordered">
            <tr><td>标题</td><td>
              <input type="text" ng-model="model.title" class="form-control text_300" placeholder="为空则不显示" />
           </td></tr>
<%--           <tr><td>模块高度</td><td><input type="text" class="form-control text_md" ng-model="model.config.height" />PX</td></tr>--%>
        </table>
    </div>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style type="text/css">
.thumbimg {max-width:100%;max-height:80px;cursor:pointer;}
</style>
<script src="/JS/Controls/ZL_Webup.js"></script>
<script src="/JS/Plugs/angular.min.js"></script>
<script>
    angular.module("APP", []).controller("ZLCtrl", function ($scope) {
        $scope.model = parent.scope.comp;
        $scope.list = [];
        //加入 instanceof Array
        for (var key in $scope.model.data.value) {
            var mod = $scope.model.data.value[key];
            if (typeof mod == "object") { $scope.list.push($scope.model.data.value[key]); }
        }
        //---------------------------
        $scope.upimg = function (item) {
            picup.sel();
            picup.up_after = function (data) { item.src = data; $scope.$digest(); }
        }
        $scope.add = function () {
            $scope.list.push({ src: "/UploadFiles/timg.jpg", url: "", order: 0 });
        }
        $scope.del = function (item) {
            for (var i = 0; i < $scope.list.length; i++) {
                if ($scope.list[i] == item) { $scope.list.splice(i, 1); return; }
            }
        }
        $scope.save = function () { $scope.model.data.value = $scope.list; parent.scope.update(); }
    });
</script>
</asp:Content>