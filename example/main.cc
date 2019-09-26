/*
 *  Copyright 2012 The WebRTC Project Authors. All rights reserved.
 *
 *  Use of this source code is governed by a BSD-style license
 *  that can be found in the LICENSE file in the root of the source
 *  tree. An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */
#include "conductor.h"
#include "peer_connection_client.h"

#include "webrtc/base/ssladapter.h"
#include "webrtc/base/thread.h"


int main(int argc, char* argv[]) 
{
    rtc::InitializeSSL();

    Conductor * pConductor = new Conductor();

    pConductor->StartLogin(const  string & server, int port);

    pConductor->ConnectToPeer(int peer_id);

    while(1)
    {
        sleep(1);
    }
        
    rtc::CleanupSSL();
    return 0;
}
