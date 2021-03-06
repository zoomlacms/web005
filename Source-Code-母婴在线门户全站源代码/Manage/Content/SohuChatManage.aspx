﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SohuChatManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.SohuChatManage" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>畅言评论管理</title>
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("CommentManage.aspx","评论管理"),
        new Bread() {url="/{manage}/Content/CommentManage.aspx", text="评论管理<a href='javascript:disDiv(2);void(0);' id='regHref'  class='text-success'> [注册管理畅言]</a>",addon="" }},
		Call.GetHelp(58)
		)
    %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="main" class="list_choice">
    <div id="onlineDiv">
        <iframe src="http://changyan.sohu.com/login" style="width: 98%; height: 960px;" frameborder="0"></iframe>
    </div>
	<div class="container-fluid">
    <div id="configDiv" class="row" style="display:none;">
		<div class="col-12 col-md-6">
        <div class="card collocation_card_l" id="addDiv">
            <div class="card-header"><h3 class="card-title">畅言配置</h3></div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <tbody>
                        <tr>
                            <td>APP_ID：</td>
                            <td><asp:TextBox runat="server" ID="chat_AppIDT" class="form-control"/></td>
                        </tr>
                        <tr>
                            <td>APP_Key：</td>
                            <td><asp:TextBox runat="server" ID="chat_AppKeyT" class="form-control" /></td>
                        </tr>
                         <tr>
                            <td>前台代码：</td>
                            <td><span>
                                <input type="radio" name="codeRadio" value="1" title="可能有兼容问题,建议先测试" id="radio0" checked="checked"/><label for="label0">高速版</label> 
                                <input type="radio" name="codeRadio" value="2" title="加载速度慢于高速版" id="radion1" /><label for="radion1">兼容版</label>
                            </span></td>
                        </tr>
                        <tr><td>操作：</td>
                            <td>
                                <asp:Button runat="server" CssClass="btn btn-info" ID="Button1" Text="保存" OnClick="saveBtn_Click" />
                                <input type="button" class="btn btn-outline-info" id="Button2" value="返回" onclick="disDiv(2);"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
		</div>
		<div class="col-12 col-md-6">
        <div class="card pull-left collocation_card_r w-100">
            <div class="card-header"><h3 class="panel-title">前台输出（拷贝下方代码到模板中即可<span class="fa fa-arrow-down"></span>）：</h3></div>
            <div class="card-body">
                <asp:TextBox runat="server" CssClass="thumbnail" ID="frontJS" TextMode="MultiLine" Width="100%" Height="300" Enabled="false"/>
            </div>
        </div>
		</div>
    </div>
	</div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript">
    function disDiv(v) {
        switch (v) {
            case 1:
                $("#configDiv").show();
                $("#onlineDiv").hide();
                $("#regHref").show();
                $("#configHref").hide();
                break;
            case 2:
                $("#configDiv").hide();
                $("#onlineDiv").show();
                $("#regHref").hide();
                $("#configHref").show();
        }
    }
    function setRadio(v) {
        $(":radio[name='codeRadio'][value='" + v + "']").attr("checked", true);
    }
</script>
</asp:Content>