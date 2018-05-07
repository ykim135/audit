{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_audit (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/yoonungkim/Library/Haskell/bin"
libdir     = "/Users/yoonungkim/Library/Haskell/ghc-8.2.2-x86_64/lib/audit-0.1.0.0"
dynlibdir  = "/Users/yoonungkim/Library/Haskell/ghc-8.2.2-x86_64/lib/x86_64-osx-ghc-8.2.2"
datadir    = "/Users/yoonungkim/Library/Haskell/share/ghc-8.2.2-x86_64/audit-0.1.0.0"
libexecdir = "/Users/yoonungkim/Library/Haskell/libexec/x86_64-osx-ghc-8.2.2/audit-0.1.0.0"
sysconfdir = "/Users/yoonungkim/Library/Haskell/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "audit_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "audit_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "audit_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "audit_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "audit_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "audit_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
