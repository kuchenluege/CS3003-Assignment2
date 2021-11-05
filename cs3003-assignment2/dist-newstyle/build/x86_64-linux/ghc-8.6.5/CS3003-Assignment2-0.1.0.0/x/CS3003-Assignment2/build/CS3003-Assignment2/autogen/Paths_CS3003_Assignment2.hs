{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_CS3003_Assignment2 (
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

bindir     = "/home/knueveta/.cabal/bin"
libdir     = "/home/knueveta/.cabal/lib/x86_64-linux-ghc-8.6.5/CS3003-Assignment2-0.1.0.0-inplace-CS3003-Assignment2"
dynlibdir  = "/home/knueveta/.cabal/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/knueveta/.cabal/share/x86_64-linux-ghc-8.6.5/CS3003-Assignment2-0.1.0.0"
libexecdir = "/home/knueveta/.cabal/libexec/x86_64-linux-ghc-8.6.5/CS3003-Assignment2-0.1.0.0"
sysconfdir = "/home/knueveta/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "CS3003_Assignment2_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "CS3003_Assignment2_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "CS3003_Assignment2_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "CS3003_Assignment2_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "CS3003_Assignment2_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "CS3003_Assignment2_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
