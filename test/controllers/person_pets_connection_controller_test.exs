defmodule PeoplePetsParty.PersonPetsConnectionControllerTest do
  use PeoplePetsParty.ConnCase

  alias PeoplePetsParty.PersonPetsConnection
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, person_pets_connection_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    person_pets_connection = Repo.insert! %PersonPetsConnection{}
    conn = get conn, person_pets_connection_path(conn, :show, person_pets_connection)
    assert json_response(conn, 200)["data"] == %{"id" => person_pets_connection.id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, person_pets_connection_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, person_pets_connection_path(conn, :create), person_pets_connection: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(PersonPetsConnection, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, person_pets_connection_path(conn, :create), person_pets_connection: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    person_pets_connection = Repo.insert! %PersonPetsConnection{}
    conn = put conn, person_pets_connection_path(conn, :update, person_pets_connection), person_pets_connection: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(PersonPetsConnection, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    person_pets_connection = Repo.insert! %PersonPetsConnection{}
    conn = put conn, person_pets_connection_path(conn, :update, person_pets_connection), person_pets_connection: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    person_pets_connection = Repo.insert! %PersonPetsConnection{}
    conn = delete conn, person_pets_connection_path(conn, :delete, person_pets_connection)
    assert response(conn, 204)
    refute Repo.get(PersonPetsConnection, person_pets_connection.id)
  end
end
