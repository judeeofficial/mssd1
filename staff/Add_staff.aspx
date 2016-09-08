<%@ Page Title="" Language="C#" MasterPageFile="~/size.master" AutoEventWireup="true" CodeFile="Add_staff.aspx.cs" Inherits="staff_Add_staff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
      <h2>
        สร้างชื่อผู้ดูแลระบบ
    </h2>
    <div id="Register" runat="server">
        <table>
            <tr>
                <td rowspan="7" valign="top" width="50%">
                        <asp:GridView ID="gv_Staff" runat="server" AutoGenerateColumns="False" DataKeyNames="staff_id"
                        DataSourceID="ods_staff" CellPadding="4" BackColor="White" BorderColor="#3366CC"
                        BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="gv_Staff_SelectedIndexChanged">
                        <SelectedRowStyle BackColor="#009999" ForeColor="#CCFF99" Font-Bold="true" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" ShowSelectButton="True" SelectText="เลือก" SelectImageUrl="~/Images/pinned.gif" />
                            <asp:BoundField DataField="staffname" HeaderText="ชื่อเข้าระบบ" ReadOnly="True" />
                            <asp:BoundField DataField="firstname" HeaderText="ชื่อ" />
                            <asp:BoundField DataField="lastname" HeaderText="นามสกุล" />
                            <asp:BoundField DataField="startdate" HeaderText="เริ่ม" ReadOnly="True" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:CheckBoxField DataField="active" HeaderText="Active" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:CheckBoxField>
                            <asp:CommandField ButtonType="Image" ShowEditButton="True" ShowDeleteButton="true"
                                CancelImageUrl="~/Images/cancel.png" DeleteImageUrl="~/Images/trash.gif" EditImageUrl="~/Images/edit.png"
                                UpdateImageUrl="~/Images/save.gif" NewImageUrl="~/Images/add.gif" InsertImageUrl="~/Images/add.gif" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="ods_staff" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>"
                        SelectCommand="SELECT * FROM [Staff]" DeleteCommand="DELETE FROM [Staff] WHERE [staff_id] = @staff_id"
                        UpdateCommand="UPDATE [Staff] SET [firstname] = @firstname, [lastname] = @lastname, [active] = @active WHERE [staff_id] = @staff_id">
                        <DeleteParameters>
                            <asp:Parameter Name="staff_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="staff_id" Type="Int32" />
                            <asp:Parameter Name="staffname" Type="String" />
                            <asp:Parameter Name="password" Type="String" />
                            <asp:Parameter Name="firstname" Type="String" />
                            <asp:Parameter Name="lastname" Type="String" />
                            <asp:Parameter DbType="Date" Name="startdate" />
                            <asp:Parameter Name="active" Type="Boolean" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="staffname" Type="String" />
                            <asp:Parameter Name="password" Type="String" />
                            <asp:Parameter Name="firstname" Type="String" />
                            <asp:Parameter Name="lastname" Type="String" />
                            <asp:Parameter DbType="Date" Name="startdate" />
                            <asp:Parameter Name="active" Type="Boolean" />
                            <asp:Parameter Name="staff_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                <td width="120px">
                    ชื่อเข้าใช้งานระบบ :
                </td>
                <td width="300px">
                    <asp:TextBox ID="txt_username" runat="server" class="form-control" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    รหัสผ่าน :
                </td>
                <td>
                    <asp:TextBox ID="txt_password" runat="server" class="form-control" TextMode="Password" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    __________________________________________________________
                </td>
            </tr>
            <tr>
                <td>
                    ชื่อ :
                </td>
                <td>
                    <asp:TextBox ID="txt_firstname" runat="server" class="form-control"  Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    นามสกุล :
                </td>
                <td>
                    <asp:TextBox ID="txt_lastname" runat="server" class="form-control" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <%-- <tr>
                <td>
                    เขต :
                </td>
                <td>
                    <asp:DropDownList ID="ddl_district" runat="server" Width="100px" AutoPostBack="True"
                        DataSourceID="DistrictData" DataTextField="district_name" DataValueField="district_id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="DistrictData" runat="server" ConnectionString="<%$ ConnectionStrings:MSSDConnectionString %>"
                        SelectCommand="SELECT * FROM [District] ORDER BY [district_id]"></asp:SqlDataSource>
                </td>
            </tr>--%>
            <tr style="height: 30px">
                <td>
                </td>
                <td valign="bottom">
                    <asp:Button ID="btn_save" runat="server" class="btn btn-primary" Width="100px" Text="บันทึก" OnClick="btn_save_Click" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btn_cancel" runat="server" class="btn btn-primary" Width="100px" Text="ยกเลิก" />
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Label ID="lbl_error" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <td>
                    <h2>
                        พื้นที่รับผิดชอบ
                    </h2>
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td>
                    <div style="clear: none; float: left; width: 150px">
                        <asp:GridView ID="gv_location" runat="server" AutoGenerateColumns="False" BackColor="White"
                            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="ods_location"
                            DataKeyNames="staff_id,district_id">
                            <Columns>
                                <asp:BoundField DataField="district_name" HeaderText="พื้นที่" SortExpression="district_name" />
                                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/trash.gif" ShowDeleteButton="True" />
                            </Columns>
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" ForeColor="#003399" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                            <SortedDescendingHeaderStyle BackColor="#002876" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="ods_location" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>"
                            SelectCommand="Select sl.staff_id, d.district_name,d.district_id From StaffLocation sl
Left Join District d On sl.district_id = d.district_id
Where sl.staff_id =@staff_id" DeleteCommand="DELETE FROM StaffLocation WHERE (staff_id = @staff_id) AND (district_id = @district_id)">
                            <DeleteParameters>
                                <asp:Parameter Name="staff_id" />
                                <asp:Parameter Name="district_id" />
                                <%--<asp:ControlParameter ControlID="gv_staff" PropertyName="SelectedValue" Name="staff_id" />
                            <asp:ControlParameter ControlID="gv_location" PropertyName="SelectedValue" Name="district_id" />--%>
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="gv_Staff" DefaultValue="0" Name="staff_id" PropertyName="SelectedValue"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div id="panel_addLocation" runat="server" style="clear: none; float: left; width: 250px;">
                        <table>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddl_district" class="form-control"  runat="server" Width="100px" AutoPostBack="True"
                                        DataSourceID="DistrictData" DataTextField="district_name" DataValueField="district_id">
                                    </asp:DropDownList>
                                   <asp:SqlDataSource ID="DistrictData" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>"
                                        SelectCommand="SELECT * FROM [District] ORDER BY [district_id]"></asp:SqlDataSource>
                                 </td>
                                <td>
                                    <asp:Button ID="btn_add" class="btn btn-primary" runat="server" Width="100px" Text="เพิ่ม" OnClick="btn_add_Click" />
                      
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_error2" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td colspan="2">
                </td>
            </tr>
        </table>
                      
              
    </div>
</asp:Content>

