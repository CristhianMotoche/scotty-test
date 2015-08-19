{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import Data.Person
import Data.Text.Lazy (pack)

main :: IO ()
main = scotty 3000 $ do

  let c = Person "21345697" "Camm" 21
  get "/" $ do
    json c

  delete "/" $ do
    html "deleted!"

  post "/" $ do
    myPerson <- jsonData
    text $ pack $ name myPerson

  put "/" $ do
    html "put-ted!"
