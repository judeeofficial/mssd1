<%@ Page Title="" Language="C#" MasterPageFile="~/size.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="page_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <script type="text/javascript" src="../script/jquery-1.11.2.min.js"></script>
  <!--  <script type="text/javascript" src="../script/location.js"></script> -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <h2>
        สร้างชื่อผู้ใช้
    </h2>
    <body>
    <div id="Register" runat="server">
       <table class="table table-bordered">
            <tr>
                <td width="120px">
                    ชื่อเข้าใช้งานระบบ :
                </td>
                <td width="300px">
                          <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txt_username"  class="form-control"  runat="server" AutoPostBack="True" 
                        ontextchanged="txtName_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_username" ErrorMessage="*"></asp:RequiredFieldValidator>
<br />
                    <asp:Label ID="lblCheck" runat="server"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <asp:Label ID="lblShow" runat="server" Text="กำลังตรวจสอบ"></asp:Label>
                </ProgressTemplate>
            </asp:UpdateProgress>
                    </td>
            </tr>
            <tr>
                <td>
                    รหัสผ่าน :
                </td>
                <td>
                   <asp:TextBox ID="txt_password" class="form-control" runat="server" TextMode="Password" Width="181px" Height="29px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_password" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    ____________________________________________________________________</td>
            </tr>
            <tr>
                <td>
                    ชื่อ :
                </td>
                <td>
                     <asp:TextBox ID="txt_firstname" class="form-control" runat="server" Width="181px" Height="29px"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_firstname" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
           
            </tr>
            <tr>
                <td>
                    นามสกุล :
                </td>
                <td>
                      <asp:TextBox ID="txt_lastname" class="form-control" runat="server" Width="181px" Height="29px"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_lastname" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
           
                 </tr>
            <tr>
                <td>
                    ที่อยู่ :
                </td>
                <td>
            <asp:TextBox ID="txt_address" class="form-control" runat="server" Width="221px" Height="35px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_address" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
          
                 </tr>
            <tr>
             
                <td>เขต</td>
                <td>
                    <asp:DropDownList ID="ddl_district" class="form-control" runat="server" Width="150px" AutoPostBack="True"
                        DataSourceID="DistrictData" DataTextField="district_name" DataValueField="district_id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="DistrictData" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>"
                        SelectCommand="SELECT * FROM [District] ORDER BY [district_id]"></asp:SqlDataSource>
                     </td>
            </tr>

             <tr>
             
                <td>แขวง</td>
                <td>
                    <asp:DropDownList ID="ddl_subdistrict" class="form-control" runat="server" Width="150px" DataSourceID="SubDistrictData"
                        DataTextField="sub_district_name" DataValueField="sub_district_id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SubDistrictData" runat="server"  ConnectionString="<%$ ConnectionStrings:Connectionstring %>"
                        ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Sub_District] WHERE ([district_id] = @district_id) ORDER BY [sub_district_name]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddl_district" DefaultValue="0" Name="district_id"
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                      </td>
            </tr>

            
             <tr>
             
                <td>จังหวัด</td>
                <td>

                    <asp:Label ID="Label3" runat="server" Text="กรุงเทพมหานคร"></asp:Label>

                </td>
            </tr>

            <tr>
             
                <td>รหัสไปรษณีย์</td>
                <td>

                              <asp:TextBox ID="txt_postal" class="form-control" runat="server" Width="181px" Height="29px"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txt_postal" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>

               <tr>
             
                <td>เบอร์โทรศัพท์</td>
                <td>

                              <asp:TextBox ID="txt_tel" class="form-control" runat="server" Width="181px" Height="29px"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txt_tel" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
              <tr>
             
                <td>Email:</td>
                <td>

                              <asp:TextBox ID="txt_email" class="form-control" runat="server" Width="181px" Height="29px"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txt_email" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>

              <tr>
             
                <td colspan="2">
        
                  <center><asp:Button ID="Save" runat="server" class="btn btn-default" Text="Save" OnClick="Save_Click" />
                    <asp:Button ID="Cancel" runat="server" class="btn btn-default" Text="Cencel" OnClick="Cancel_Click" /></center> 
                    
                  </td>
              
            </tr>
        </table>

    </div>
        </body>
</asp:Content>

