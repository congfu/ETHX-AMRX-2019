function [scannerPose] = bob_getScannerPose(connection)
    global isoctave;
    if ~isoctave
        [result,data]=connection.vrep.simxGetStringSignal(connection.clientID,strcat('Bob_laserScannerPose',num2str(connection.robotNb)),connection.vrep.simx_opmode_oneshot_wait);
        if (result~=connection.vrep.simx_error_noerror)
            err = MException('VREP:RemoteApiError', ...
                            'simxGetStringSignal failed');
            throw(err);
        end
        if(isempty(data))
            err = MException('VREP:RemoteApiError', ...
                'Empty data returned');
            throw(err);
        end
        scannerPose=connection.vrep.simxUnpackFloats(data);
    else
        [result,data]=simxGetStringSignal(connection.clientID,strcat('Bob_laserScannerPose',num2str(connection.robotNb)),connection.vrep.simx_opmode_oneshot_wait);
        if (result~=connection.vrep.simx_error_noerror)
            error('simxGetStringSignal failed');
        end
        if(isempty(data))
            error('empty data returned');
        end
        scannerPose=simxUnpackFloats(data);
    end
end