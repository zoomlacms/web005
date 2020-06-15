﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailReBox.aspx.cs" Inherits="ZoomLaCMS.Plat.EMail.MailReBox"  MasterPageFile="~/Plat/Main.master" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
<title>回收站</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="platcontainer container email">
    <div class="d-flex">
        <ul class="nav nav-tabs">
            <li class="nav-item" data-type="0"><a class="nav-link" href="MailList.aspx">收件箱</a></li>
            <li class="nav-item" data-type="1"><a class="nav-link" href="MailList.aspx?mailtype=1">发件箱</a></li>
            <li class="nav-item" data-type="-2"><a class="nav-link active" href="MailReBox.aspx">回收站</a></li>
        </ul>
		<div class="email_op ml-auto">
            <asp:DropDownList runat="server" ID="MailList_DP" DataTextField="Acount" DataValueField="Acount" CssClass="text_md" OnSelectedIndexChanged="MailList_DP_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            <a href="javascript:;">当前共<span runat="server" id="count_sp">0</span>封邮件</a>
            <a href="MailWrite.aspx"><i class="fa fa-pencil-square"></i> 新邮件</a>
            <a href="MailConfig.aspx"><i class="fa fa-cog"></i> 邮件设置</a>
            <a href="Default.aspx" title="返回"><i class="fa fa-chevron-circle-left fa-3x"></i></a>
        </div>
    </div>
    <ZL:ExGridView runat="server" ID="EGV" CssClass="table table-bordered table-hover" AutoGenerateColumns="false" OnPageIndexChanging="EGV_PageIndexChanging"
            AllowPaging="true" PageSize="20" EnableTheming="False" GridLines="None" EmptyDataText="当前没有邮件!!">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <%#Eval("ID") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="标题">
                    <ItemTemplate>
                        <a href="MailDetail.aspx?ID=<%#Eval("ID") %>"><%#Eval("Title") %></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="发件人">
                    <ItemTemplate>
                        <%#Eval("Sender") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="发件时间">
                    <ItemTemplate>
                        <%#Eval("MailDate","{0:yyyy年MM月dd日 HH:mm}")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="创建时间">
                    <ItemTemplate>
                        <%#Eval("CDate") %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    <asp:Button ID="Dels" runat="server" Text="批量删除" class="btn btn-outline-danger" OnClick="Dels_Click" OnClientClick="return confirm('确定要彻底删除选定邮件吗!!');" />
    <asp:Button ID="ReBox" runat="server" Text="批量还原" OnClick="ReBox_Click" class="btn btn-outline-info" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript">
    $(function () { setactive("办公"); })
</script>
</asp:Content>

