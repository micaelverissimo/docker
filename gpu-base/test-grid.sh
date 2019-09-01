prun \
     --exec \
       "sh -c '. /setup_envs.sh && python /test-gpu.py';" \
     --excludedSite=ANALY_DESY-HH_UCORE,ANALY_MWT2_SL6,ANALY_MWT2_HIMEM,ANALY_DESY-HH,ANALY_FZK_UCORE,ANALY_FZU,DESY-HH_UCORE,FZK-LCG2_UCORE \
     --containerImage=docker://jodafons/gpu-base:latest \
     --excludeFile="*.o,*.so,*.a,*.gch,Download/*,InstallArea/*,RootCoreBin/*,RootCore/*,*new_env_file.sh," \
     --noBuild \
     --outDS=user.jodafons.test_23 \
     --site=ANALY_MANC_GPU_TEST \
     --cmtConfig nvidia-gpu \
     --disableAutoRetry \
