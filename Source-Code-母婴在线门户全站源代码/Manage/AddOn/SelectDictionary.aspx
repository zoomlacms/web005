﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectDictionary.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.SelectDictionary"  MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="Head"><title>选择数据字典</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="input-group">
    <span class="input-group-prepend"><span class="input-group-text">分类名</span></span>
    <asp:TextBox ID="txtCategoryName" class="form-control" runat="server" placeholder="分类名"></asp:TextBox>
    <span class="input-group-append">
        <asp:Button ID="btnSearch" runat="server" Text="搜索" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
        <input type="button" value="确定选择" onclick="add();" class="btn btn-primary"/>
    </span>
</div>
<asp:HiddenField ID="HdnNameKey" runat="server" />
<div class="clearbox"></div>
<div style="margin-top:5px;">
<ZL:ExGridView ID="EGV" DataKeyNames="DicCateID" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" 
    EmptyDataText="无相关数据" CssClass="table table-bordered table-striped">
    <Columns>                
        <asp:BoundField DataField="DicCateID" HeaderText="序号" ItemStyle-CssClass="td_s">
        </asp:BoundField>                                               
        <asp:TemplateField HeaderText="分类名">
            <ItemTemplate>                                
               <%# Eval("CategoryName")%>
            </ItemTemplate>
        </asp:TemplateField>                                                      
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_m">
        <ItemTemplate>
            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" CommandArgument='<%# Eval("DicCateID") %>'>选择</asp:LinkButton>                    
        </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
</div>
<div style="padding: 5px;">
    <asp:TextBox ID="TxtSelectDic" runat="server" TextMode="MultiLine" Rows="8" class="form-control"></asp:TextBox>
    <asp:HiddenField ID="HdnContrID" runat="server" />
</div>
<script>
function add() {
    var conid = document.getElementById('<%= HdnContrID.ClientID %>').value;
    var val = document.getElementById('TxtSelectDic').value;
    opener.mfield.addFromDic(conid, val);
    window.close();
}
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script"></asp:Content>