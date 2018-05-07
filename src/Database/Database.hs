{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE BangPatterns #-}

module Database.Database where

import Control.Monad.Reader
import Database.MySQL.Simple
import Database.MySQL.Simple.QueryResults
import Models.User

instance QueryResults User where
  convertResults [fa, fb] [va, vb] = User a b
    where !a = convert fa va
          !b = convert fb vb

-- readUser :: Int -> ReaderT Connection IO (Maybe User)
-- readUser userId = ask >>= \conn -> do
--   users <- liftIO $ query
--     conn
--     "SELECT * FROM users WHERE id = ?"
--     (Only userId)
--   pure $ case users of
--     [u] -> Just u
--     _   -> Nothing
