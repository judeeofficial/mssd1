<%@ Page Title="" Language="C#" MasterPageFile="~/size.master" AutoEventWireup="true" CodeFile="edit_customer.aspx.cs" Inherits="page_edit_customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <center><h7>แก้ไขข้อมูลส่วนตัว</h7></center>
  <h9> <table class="table table-bordered">
     
             <tr>
                <td>
                    ชื่อ :
                </td>
                <td>
                     <asp:TextBox ID="txt_firstname" class="form-control" runat="server" Width="262px" Height="31px"></asp:TextBox>
                </td>
           
            </tr>
            <tr>
                <td>
                    นามสกุล :
                </td>
                <td>
                      <asp:TextBox ID="txt_lastname" class="form-control" runat="server" Width="260px" Height="33px"></asp:TextBox>
                </td>
           
                 </tr>
            <tr>
                <td>
                    ที่อยู่ :
                </td>
                <td>
            <asp:TextBox ID="txt_address" class="form-control" runat="server" Width="321px" Height="34px" TextMode="MultiLine"></asp:TextBox>
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
                </td>
            </tr>

               <tr>
             
                <td>เบอร์โทรศัพท์</td>
                <td>

                              <asp:TextBox ID="txt_tel" class="form-control" runat="server" Width="181px" Height="29px"></asp:TextBox>
                </td>
            </tr>
              <tr>
             
                <td>Email:</td>
                <td>

                              <asp:TextBox ID="txt_email" class="form-control" runat="server" Width="181px" Height="29px"></asp:TextBox>
                </td>
            </tr>
      <tr>
                <td colspan="2">
        
                  <center>
                      <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" class="btn btn-primary" Text="Save" Width="154px" />
                    </center> 
                    
                  </td>
              
            </tr>
        <tr>
                <td colspan="2">
        
                  <center>
                    <asp:Label ID="lblerror" runat="server" ></asp:Label>
                    </center> 
                    
                  </td>
              
            </tr>
        
    </table>

    </h9> 
    
</asp:Content>

