module Paths_test (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/cmotoche/Documents/haskell/scotty/.cabal-sandbox/bin"
libdir     = "/home/cmotoche/Documents/haskell/scotty/.cabal-sandbox/lib/x86_64-linux-ghc-7.10.1/test-0.1.0.0-G5Sd1Tl5QeL8L8PlvR9E1U"
datadir    = "/home/cmotoche/Documents/haskell/scotty/.cabal-sandbox/share/x86_64-linux-ghc-7.10.1/test-0.1.0.0"
libexecdir = "/home/cmotoche/Documents/haskell/scotty/.cabal-sandbox/libexec"
sysconfdir = "/home/cmotoche/Documents/haskell/scotty/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "test_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "test_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "test_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "test_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "test_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
