# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Repo.insert!(%Blog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Blog.{Accounts, Posts}

user = %{
  email: "kadmothadeu@gmail.com",
  first_name: nil,
  image:
    "https://lh3.googleusercontent.com/a-/AOh14Gi0luF1Qw9rAO46oSG34AjQ4_R7eNFEir_X2fVT4A=s96-c",
  last_name: nil,
  provider: "google",
  token:
    "ya29.a0AfH6SMDcZ2rcYQbHjFt1dLARU75m2IxnwA5lM210eRLn33U_2QbEOIZgWbAshUB4hTCz_giGE3V7AN4p5EIEE8rfB4shSTLWITll-tS1uHRIvOv1rx713pB9BNIDqIudYaiAHq1mXtxztKmTugy3NkMrJDFz87XdD6DNHWmorzA"
}

user_2 = %{
  email: "joao@gmail.com",
  first_name: nil,
  image:
    "https://lh3.googleusercontent.com/a-/AOh14Gi0luF1Qw9rAO46oSG34AjQ4_R7eNFEir_X2fVT4A=s96-c",
  last_name: nil,
  provider: "google",
  token:
    "ya29.a0AfH6SMDcZ2rcYQbHjFt1dLARU75m2IxnwA5lM210eRPn33U_2QbEOIZgWbAshUB4hTCz_giGE3V7AN4p5EIEE8rfB4shSTLWITll-tS1uHRIvOv1rx713pB9BNIDqIudYaiAHq1mXtxztKmTugy3NkMrJDFz87XdD6DNHWmorzA"
}
post = %{title: "Phoenix Framework", description: "teste 1"}

{:ok, user} = Accounts.create_user(user)
{:ok, _user_2} = Accounts.create_user(user_2)

{:ok, _post} = Posts.create_post(user, post)
