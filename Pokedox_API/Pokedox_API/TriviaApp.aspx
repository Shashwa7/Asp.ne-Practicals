<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TriviaApp.aspx.cs" Inherits="Pokedox_API.TriviaApp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trivia App</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <style>
        * {
            box-sizing: border-box;
        }

        html {
            font-size: 1rem;
        }


        #appTitle {
            margin: 1.5rem;
            text-align: center;
        }

        #form1 {
            padding: .8rem;
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
        }


        #triviaBody {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            padding: 1rem;
        }

        #triviaContainer {
            flex: 1;
            text-align: center;
        }

        .triviaCard {
            margin: .5rem;
            width: 100%;
        }

        .option {
            display: block;
            cursor: pointer;
            width: 100%;
            font-size: 1rem;
        }

        .success {
            color: green;
        }

        .failure {
            color: red;
        }

        #mcq_options {
            text-align: start;
            width: 100%;
        }

        table, tbody, tr, td {
            display: block;
            width: 100%;
        }

        input {
            margin: .5rem;
        }

        td {
            border: 1px solid gray;
            border-radius: 3px;
        }

        tr {
            margin: .5rem 0;
        }

        #categories {
            margin: 1rem;
        }
    </style>
    <script type="text/javascript">
    function ValidateRadioButtonList() {
    var isChecked = false;
    var rbl = document.getElementById("<%=mcq_options.ClientID%>");
        var radioButtons = rbl.getElementsByTagName("input");
        for (var i = 0; i < radioButtons.length; i++) {
            if (radioButtons[i].checked) {
                radioButtons[i].classList.add("success");
            } else {
                radioButtons[i].classList.add("failure");
            }
        }
    return isChecked;
    }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="appTitle">
            <h2>Trivia App</h2>
        </div>
        <div id="categories">
            <asp:Button ID="csBtn" runat="server" class="btn btn-primary" Text="Computer" OnClick="csBtn_Click" />
            <asp:Button ID="mathBtn" runat="server" class="btn btn-success" Text="Mathematics" OnClick="mathBtn_Click" />
            <asp:Button ID="gkBtn" runat="server" class="btn btn-warning" Text="General Knowledge" OnClick="gkBtn_Click" />
            <asp:Button ID="snBtn" runat="server" class="btn btn-info" Text="Science & Nature" OnClick="snBtn_Click" />
            <asp:Button ID="sportBtn" runat="server" class="btn btn-dark" Text="Sports" OnClick="sportBtn_Click" />
        </div>



        <div id="triviaBody" runat="server">
            <asp:ImageButton ID="backBtn" runat="server" Style='width: 5rem;' ImageUrl="https://www.flaticon.com/svg/static/icons/svg/130/130882.svg" OnClick="backBtn_Click" />

            <div id="triviaContainer" runat="server">
                <div class='card triviaCard'>
                    <asp:Label ID="question" class="card-header" runat="server" />
                    <div class='card-body'>
                        <asp:RadioButtonList ID="mcq_options" class='list-group list-group-flush' runat="server" AutoPostBack="true" OnSelectedIndexChanged="mcq_options_SelectedIndexChanged">
                        </asp:RadioButtonList>
                    </div>
                </div>
                <div id="triviaStats">
                    <button id="totalQues" type="button" class="btn btn-primary">
                        Question: <span id="queNo" class="badge badge-light" runat="server"></span>
                    </button>

                    <button id="totalAnswered" type="button" class="btn btn-primary">
                        Answered: <span id="answered" class="badge badge-light" runat="server"></span>
                    </button>

                    <asp:Button ID="submitTestBtn" runat="server" class="btn btn-success" Text="Submit" OnClick="submitTestBtn_Click" />
                </div>

            </div>

            <asp:ImageButton ID="nextBtn" runat="server" Style='width: 5rem;' ImageUrl="https://www.flaticon.com/svg/static/icons/svg/130/130884.svg" OnClick="nextBtn_Click" />

        </div>
        <div id="triviaResult" runat="server">
        </div>

    </form>

</body>
</html>
