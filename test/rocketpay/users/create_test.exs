defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, return an user" do
      params = %{
        name: "Neymar",
        password: "123123",
        nickname: "Ney",
        email: "menino_ney@gmail.com",
        age: 27
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Rafael", age: 27, id: ˆuser_id } = user
    end

    test "when there are invalid params, return an error" do
      params = %{
        name: "Neymar",
        nickname: "Ney",
        email: "menino_ney@gmail.com",
        age: 15
      }

      {:error, changeset} = Create.call(params)

      expect_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }
      assert errors_on(changeset) = expect_response
    end
end
