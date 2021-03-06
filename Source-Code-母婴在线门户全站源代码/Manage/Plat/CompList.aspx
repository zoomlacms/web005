﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompList.aspx.cs" Inherits="ZoomLaCMS.Manage.Plat.CompList" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head"><title>公司管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb fixed-top">
    <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'><%=Resources.L.工作台 %></a></li>
    <li class="breadcrumb-item"><a href='CompList.aspx'>能力中心</a></li>
    <li class="breadcrumb-item"><a href='PlatInfoManage.aspx'>信息管理</a> [<a href='AddComp.aspx'>添加公司</a>]</li>
    <div id="help" class="pull-right text-center"><a href="javascript::" id="sel_btn" class="help_btn"><i class="fa fa-search"></i></a></div>
    <div id="sel_box" runat="server">
        <div>
            <div class="input-group">
                <asp:TextBox ID="Skey_T" placeholder="请输入公司名称" runat="server" CssClass="form-control max20rem" />
                <span class="input-group-append">
                    <asp:Button ID="Search_B" runat="server" Text="<%$Resources:L,搜索 %>" class="btn btn-outline-secondary" OnClick="Search_B_Click" />
                </span>
            </div>
        </div>
    </div>
</ol>
<div class="table-responsive-md list_choice pr-1">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false"
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand"
        CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" OnRowDataBound="EGV_RowDataBound">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="w1rem">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:TemplateField HeaderText="Logo">
                <ItemTemplate><%#ComRE.Img_NoPic(Eval("CompLogo","")) %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="名称">
                <ItemTemplate><a href="AddComp.aspx?ID=<%#Eval("ID") %>"><%#Eval("CompName") %></a></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="创建人">
                <ItemTemplate>
                    <%--<a href="../User/UserInfo.aspx?id=<%#Eval("CreateUser") %>"><%#Eval("UserName") %></a>--%>
                    <a href="javascript:void(0);>" onclick="SelUser(<%#Eval("CreateUser") %>)"><%#Eval("UserName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="企业邮箱" DataField="Mails" />
            <asp:BoundField HeaderText="创建时间" DataField="CreateTime" DataFormatString="{0:yyyy年MM月dd日 HH:mm}" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a  href="AddComp.aspx?id=<%#Eval("ID") %>"><i class="fa fa-pencil" title="修改"></i></a>
                    <a  href="MemberList.aspx?compid=<%#Eval("id") %>"><i class="fa fa-users"></i> 成员</a>
                    <a href="WordTlp.aspx?ID=<%#Eval("ID") %>" ><i class="fa fa-list"></i>报表</a>
                    <asp:LinkButton runat="server"  CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o" title="删除"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
	<div class="sysBtline">
    <asp:Button ID="Dels_Btn" runat="server" CssClass="btn btn-outline-danger" Text="批量删除" OnClientClick="return confirm('是否确认删除?')" OnClick="Dels_Btn_Click" /></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        var TemDiag = new ZL_Dialog();
        var SelUser = function (uid) {
            TemDiag.title = "用户信息";
            TemDiag.maxbtn = false;
            TemDiag.url = "../User/UserInfo.aspx?id=" + uid;
            TemDiag.ShowModal();
        }
        $("#sel_btn").click(function (e) {
            if ($("#sel_box").css("display") == "none") {
                $(this).addClass("active");
                $("#sel_box").slideDown(300);
                $("#EGV").css("margin-top", "44px");
            }
            else {
                $(this).removeClass("active");
                $("#sel_box").slideUp(200);
                $("#EGV").css("margin-top", "0px");
            }
        });
    </script>
</asp:Content>
