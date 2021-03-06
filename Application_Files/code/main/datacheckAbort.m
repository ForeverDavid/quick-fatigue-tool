function [] = datacheckAbort(Sxx, Syy, Szz, Txy, Tyz, Txz, tic_pre, outputField, fid_status)
%DATACHECKABORT    QFT function to abort analysis at data check phase.
%
%   DATACHECKABORT is used internally by Quick Fatigue Tool. The user
%   is not required to run this file.
%   
%   Quick Fatigue Tool 6.11-05 Copyright Louis Vallance 2017
%   Last modified 03-Oct-2017 13:44:11 GMT
    
    %%
    
if outputField == 1.0
    printTensor(Sxx, Syy, Szz, Txy, Tyz, Txz)
end

setappdata(0, 'dataCheck_time', toc(tic_pre))

if getappdata(0, 'echoMessagesToCWIN') == 1.0
    fprintf('\n[NOTICE] Data Check complete. Scroll up for details (%fs)\n', toc(tic_pre))
else
    fprintf('\n[NOTICE] Data Check complete (%fs)\n', toc(tic_pre))
end
messenger.writeMessage(-999.0)
fprintf(fid_status, '\r\n\r\nTHE ANALYSIS HAS COMPLETED SUCCESSFULLY');
fclose(fid_status);
end