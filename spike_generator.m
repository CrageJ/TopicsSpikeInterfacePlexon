%generating datasets
clear

cd D:\TESTDATA

noise_array = [100 90 80 70 60 50]
rng_array = [111111,222222,333333]
for n = 1:length(noise_array)
    for r = 1:length(rng_array)

        targets = 4 ; % number of target neurons
        jitter =  7 ; %number of jittered versions of the original spike train
        uncorr = 15 ; % number of uncorrelated spike trains
        [a,b,c] = generateSpikes(targets,jitter,uncorr,rng_array(r),noise_array(n));
        %deadtime
        
    end
end

function [signal_array,time_struct,info_struct] = generateSpikes(targets,jitter,uncorr,RNG,noise)

    n_targets = targets ; % number of target neurons
    n_jitter =  jitter ; %number of jittered versions of the original spike train
    n_uncorr = uncorr ; % number of uncorrelated spike trains
    n_reuse_rng_state = RNG;
    n_noise_snr = noise;
    n_duration = duration;

    info_struct.targets = targets;
    info_struct.jitter =  jitter ; %number of jittered versions of the original spike train
    info_struct.uncorr = uncorr ; % number of uncorrelated spike trains
    info_struct.rng = RNG;
    info_struct.noise = noise;
    info_struct.duration = duration;

    [finalsignal, targetsinfo, rngreturnstatus] = generatenoisysamples('N_Targets', n_targets, 'N_Jitter',n_jitter,'N_Uncorr',n_uncorr, 'ReuseRNGState', n_reuse_rng_state ,'NoiseSNR',n_noise_snr);
    %             case 'N_Targets'
    %             case 'N_Jitter'
    %             case 'N_Uncorr'
    %             case 'ReuseTargets'
    %             case 'Duration'
    %             case 'DSLength'
    %             case 'ReuseRNGState'
    %             case 'RefractoryPeriod'
    %             case 'T_Delta_Integrate'
    %             case 'N_Delta_Integrate'
    %             case 'ReuseTargetTimes'
    %             case 'TemporalDataInFile'
    %             case 'TemporalDirectory'
    %             case 'ShowSNR'
    %             case 'Orig_Temporal_Supplied'
    %             case 'SameTargetSizes'
    %             case 'Target1weights'
    %             case 'NoiseSNR'
    signal_array=finalsignal;
    
    for i= 1:targets
        time_struct(i).time = targetsinfo(i).targettimes;
    end
end

