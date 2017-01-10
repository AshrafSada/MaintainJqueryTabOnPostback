<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MaintainJqueryTabOnPostback.WebForm1" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/themes/base/jquery-ui.min.css" rel="stylesheet" />
    <style>
        .required:after {
            content: " * ";
            font-weight: bold;
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="tabs">
                <ul>
                    <li><a href="#tab-1">Main</a></li>
                    <li><a href="#tab-2">Sub</a></li>
                </ul>
                <div id="#tab-1">
                    <h3>Main</h3>
                </div>
                <div id="tab-2">
                    <table>
                        <tr>
                            <td>Country:</td>
                            <td>
                                <asp:DropDownList ID="ddlCountries" runat="server" AutoPostBack="true" ClientIDMode="Static"
                                    OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>City:</td>
                            <td>
                                <asp:DropDownList ID="ddlCities" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="selected_tab" runat="server" Value="0" />
    </form>

    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.min.js"></script>
    <script>
        $(function () {
            $('#tabs').tabs({
                activate: function () {
                    var newIdx = $('#tabs').tabs('option', 'active');
                    $('#<%=selected_tab.ClientID%>').val(newIdx);

                }, heightStyle: "auto",
                active: previouslySelectedTab,
                show: { effect: "fadeIn", duration: 1000 }
            });
        });
    </script>
</body>
</html>
