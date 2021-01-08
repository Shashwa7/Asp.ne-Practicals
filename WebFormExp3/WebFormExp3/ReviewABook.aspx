<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewABook.aspx.cs" Inherits="WebFormExp3.ReviewABook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 100vw;
            height: 100vh;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">


        <div class="card mb-3" style="max-width: 40vw">
            <div class="row no-gutters">
                <div class="col-md-4">
                    <asp:Image ID="bookCover" runat="server" ImageUrl="https://itbook.store/img/books/9781484255087.png" class="card-img" alt="book-cover" />
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title">Bipin Joshi</h5>
                        <p class="card-text">Beginning Database Programming Using ASP.NET Core 3: With MVC, Razor Pages, Web API, JQuery, Angular, SQL Server, and NoSQL.</p>

                        <p class="card-text">
                            <h5 class="card-title">Your review:</h5>
                            <asp:Button runat="server" ID="goodBtn" class="btn btn-outline-success" Text="Good" OnClick="goodBtn_Click" />
                            <asp:Button runat="server" ID="avgBtn" class="btn btn-outline-warning" Text="Satisfactory" OnClick="avgBtn_Click" />
                            <asp:Button runat="server" ID="badBtn" class="btn btn-outline-danger" Text="Bad" OnClick="badBtn_Click" />
                        </p>

                        <div class="card-text">
                            <ul class="list-group list-group-flush">
                                <asp:Label ID="tr" runat="server" Text="Total Reviews: 0" class="list-group-item text-muted" />
                                <asp:Label ID="tgr" runat="server" Text="Good Reviews: 0,0%" class="list-group-item text-muted" />
                                <asp:Label ID="tsr" runat="server" Text="Satifactory Reviews: 0,0%" class="list-group-item text-muted" />
                                <asp:Label ID="tbr" runat="server" Text="Bad Reviews: 0,0%" class="list-group-item text-muted" />
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
