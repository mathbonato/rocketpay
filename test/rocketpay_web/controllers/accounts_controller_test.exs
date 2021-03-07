defmodule RocketpayWeb.AccountsControllerTest do
  use RocketpayWeb.ConnCase

  alias Rocketpay.{User, Account}

  describe "deposit/2" do
    setup %{conn: conn} do
      user_params = %{
        name: "Neymar",
        nickname: "Ney",
        email: "menino_ney@gmail.com",
        age: 15
      }

      {:ok, %User{account: %Account(id: account_id)}} = Rocketpay.create_user(user_params)

      conn = put_req_header(conn, "Authorization", "Basic" )

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make the deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert response =
    end
  end
end
