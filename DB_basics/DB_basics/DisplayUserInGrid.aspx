<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayUserInGrid.aspx.cs" Inherits="DB_basics.DisplayUserInGrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
   
        body {
  
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        #form1{
            text-align: center;
            margin:1rem;
        }

         #btnHome {
            margin: 1rem;
            font-size: 1rem;
        }

        .textLeft {
            text-align: left;
        }
        .btnStyle{
            font-size:1rem;
            border-radius:5px;
            margin:0 .5rem;
        }
    </style>

     <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />

    <title>All Users</title>
</head>
<body>
    <form id="form1" runat="server">

        <div>
             <p class="h2 mb-6 text-center">User DB</p>
        </div>
        <div>
            <asp:GridView ID="UsersGrid" DataKeyNames="user_id" runat="server"
                AutoGenerateColumns="False"
                BackColor="White" BorderColor="#E7E7FF"
                BorderStyle="None" BorderWidth="1px" CellPadding="3"
                GridLines="Horizontal"
                OnRowDeleting="UsersGrid_DeleteRow"
                OnRowEditing="UsersGrid_EditRow"
                OnRowCancelingEdit="UsersGrid_CancelUpdate"
                OnRowUpdating="UsersGrid_UpdateRow"
                OnSelectedIndexChanging="UsersGrid_InsertNewRow"
                Style="margin-top: 15px" ShowFooter="True">
                <AlternatingRowStyle BackColor="#F7F7F7" />

                <Columns>

                    
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lb_uID" runat="server" Text='<%# Bind("user_id") %>'></asp:Label>
                        </ItemTemplate>

                        <FooterTemplate>
                            <!-- Footer tmplt for insert operation -->

                            <asp:TextBox ID="tb_insert_uID" runat="server" />

                            <!-- Req field validator -->
                            <asp:RequiredFieldValidator ID="insert_ID_RqF" runat="server"
                                ErrorMessage="User ID field can't be empty!"
                                ControlToValidate="tb_insert_uID"
                                Text="*"
                                ForeColor="Red" 
                                ValidationGroup="INSERT"/>
                        </FooterTemplate>

                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="First Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="tb_ufName" runat="server" Text='<%# Bind("user_fname") %>'></asp:TextBox>

                            <!-- Req field validator -->
                            <asp:RequiredFieldValidator ID="fName_RqF" runat="server"
                                ErrorMessage="User first name field can't be empty!"
                                ControlToValidate="tb_ufName"
                                Text="*"
                                ForeColor="Red" />

                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lb_ufName" runat="server" Text='<%# Bind("user_fname") %>'></asp:Label>
                        </ItemTemplate>

                        
                        <FooterTemplate>
                            <!-- Footer tmplt for insert operation -->

                            <asp:TextBox ID="tb_insert_ufName" runat="server" />

                            <!-- Req field validator -->
                            <asp:RequiredFieldValidator ID="insert_fName_RqF" runat="server"
                                ErrorMessage="User first name field can't be empty!"
                                ControlToValidate="tb_insert_ufName"
                                Text="*"
                                ForeColor="Red" 
                                ValidationGroup="INSERT"/>
                        </FooterTemplate>

                    </asp:TemplateField>

                    
                    <asp:TemplateField HeaderText="Last Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="tb_ulName" runat="server" Text='<%# Bind("user_lname") %>'></asp:TextBox>

                            <!-- Req field validator -->
                            <asp:RequiredFieldValidator ID="lName_RqF" runat="server"
                                ErrorMessage="User last name field can't be empty!"
                                ControlToValidate="tb_ulName"
                                Text="*"
                                ForeColor="Red" />

                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lb_ulName" runat="server" Text='<%# Bind("user_lname") %>'></asp:Label>
                        </ItemTemplate>

                        
                        <FooterTemplate>
                            <!-- Footer tmplt for insert operation -->

                            <asp:TextBox ID="tb_insert_ulName" runat="server" />

                            <!-- Req field validator -->
                            <asp:RequiredFieldValidator ID="insert_lName_RqF" runat="server"
                                ErrorMessage="User last name field can't be empty!"
                                ControlToValidate="tb_insert_ulName"
                                Text="*"
                                ForeColor="Red" 
                                ValidationGroup="INSERT"/>
                        </FooterTemplate>

                    </asp:TemplateField>

                    

                    <asp:TemplateField HeaderText="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="tb_uName" runat="server" Text='<%# Bind("user_name") %>'></asp:TextBox>

                            <!-- Req field validator -->
                            <asp:RequiredFieldValidator ID="name_RqF" runat="server"
                                ErrorMessage="User name field can't be empty!"
                                ControlToValidate="tb_uName"
                                Text="*"
                                ForeColor="Red" />

                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lb_uName" runat="server" Text='<%# Bind("user_name") %>'></asp:Label>
                        </ItemTemplate>

                        
                        <FooterTemplate>
                            <!-- Footer tmplt for insert operation -->

                            <asp:TextBox ID="tb_insert_uName" runat="server" />

                            <!-- Req field validator -->
                            <asp:RequiredFieldValidator ID="insert_name_RqF" runat="server"
                                ErrorMessage="User name field can't be empty!"
                                ControlToValidate="tb_insert_uName"
                                Text="*"
                                ForeColor="Red" 
                                ValidationGroup="INSERT"/>
                        </FooterTemplate>

                    </asp:TemplateField>



                    <asp:TemplateField HeaderText="Gender">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_genders" runat="server" >
                                <asp:ListItem>Select Gender</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>

                            <!-- Req field validator -->
                            <asp:RequiredFieldValidator ID="gender_RqF" runat="server"
                                ErrorMessage="Kindly select a valid gender!"
                                ControlToValidate="ddl_genders"
                                Text="*"
                                ForeColor="Red"
                                InitialValue="Select Gender" />
                            <!-- in-case user selects 'Select Gender' as value it will throw the error!-->
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lb_uGender" runat="server" Text='<%# Bind("user_gender") %>'></asp:Label>
                        </ItemTemplate>

                        
                        <FooterTemplate>
                            <!-- Footer tmplt for insert operation -->

                             <asp:DropDownList ID="ddl_insert_genders" runat="server">
                                <asp:ListItem>Select Gender</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>

                            <!-- Req field validator -->
                            <asp:RequiredFieldValidator ID="insert_gender_RqF" runat="server"
                                ErrorMessage="Kindly select a valid gender!"
                                ControlToValidate="ddl_insert_genders"
                                Text="*"
                                ForeColor="Red"
                                InitialValue="Select Gender"
                                ValidationGroup="INSERT"/>
                        </FooterTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Email">
                        <EditItemTemplate>
                            <asp:TextBox ID="tb_uEmail" runat="server" Text='<%# Bind("user_email") %>'></asp:TextBox>

                            <!-- Req field validator -->
                            <asp:RequiredFieldValidator ID="email_RqF" runat="server"
                                ErrorMessage="Email field can't be empty!"
                                ControlToValidate="tb_uEmail"
                                Text="*"
                                ForeColor="Red" />

                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lb_uEmail" runat="server" Text='<%# Bind("user_email") %>'></asp:Label>
                        </ItemTemplate>

                        
                        <FooterTemplate>
                            <!-- Footer template for insert operation -->

                            <asp:TextBox ID="tb_insert_uEmail" runat="server"/>

                             <!-- Req field validator -->
                            <asp:RequiredFieldValidator ID="insert_email_RqF" runat="server"
                                ErrorMessage="Email field can't be empty!"
                                ControlToValidate="tb_insert_uEmail"
                                Text="*"
                                ForeColor="Red"
                                ValidationGroup="INSERT"/>
                        </FooterTemplate>

                    </asp:TemplateField>
                    

                    <asp:TemplateField HeaderText="Password">
                        <EditItemTemplate>
                            <asp:TextBox ID="tb_uPwd" runat="server" Text='<%# Bind("user_pwd") %>' TextMode="Password"></asp:TextBox>

                            <!-- Req field validator -->
                            <asp:RequiredFieldValidator ID="Pwd_RqF" runat="server"
                                ErrorMessage="Password field can't be empty!"
                                ControlToValidate="tb_uPwd"
                                Text="*"
                                ForeColor="Red" />

                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lb_uPwd" runat="server" Text='<%# Bind("user_pwd") %>' ></asp:Label>
                        </ItemTemplate>

                        
                        <FooterTemplate>
                            <!-- Footer tmplt for insert operation -->

                            <asp:TextBox ID="tb_insert_uPwd" runat="server" TextMode="Password"/>

                            <!-- Req field validator -->
                            <asp:RequiredFieldValidator ID="insert_Pwd_RqF" runat="server"
                                ErrorMessage="Passwrod field can't be empty!"
                                ControlToValidate="tb_insert_uPwd"
                                Text="*"
                                ForeColor="Red" 
                                ValidationGroup="INSERT"/>
                        </FooterTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Operations">
                        <EditItemTemplate>
                            <asp:Button ID="updateBtn" runat="server" CommandName="Update" Text="Update"  />
                            <asp:Button ID="cancelBtn" runat="server" CommandName="Cancel" Text="Cancel"  />
                        </EditItemTemplate>

                        <ItemTemplate>
                            <asp:Button ID="editBtn" runat="server" CommandName="Edit" Text="Edit" />
                            <asp:Button ID="dltBtn" runat="server" CommandName="Delete" Text="Delete" />
                        </ItemTemplate>

                        <FooterTemplate>
                            <asp:Button ID="insertBtn" runat="server" Text="Insert" CommandName="Select" ValidationGroup="INSERT" Width="100%" />
                        </FooterTemplate>

                        <ControlStyle Width="150px" />

                    </asp:TemplateField>


                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <asp:ValidationSummary ID="ValidationSummaryforInsert" ValidationGroup="INSERT" runat="server" ForeColor="red" CssClass="textLeft" />
            
            <!-- By default it will handle rest of the Validations so no need to explicitly define the ValidationGroup-->
            <asp:ValidationSummary ID="ValidationSummaryforUpdate" runat="server" ForeColor="red" CssClass="textLeft" />
        </div>
        <div>
            <asp:Button ID="btnHome" runat="server" Text="Home" OnClick="btnHome_Click" />
        </div>
    </form>
</body>
</html>
