/*M///////////////////////////////////////////////////////////////////////////////////////
//
//  IMPORTANT: READ BEFORE DOWNLOADING, COPYING, INSTALLING OR USING.
//
//  By downloading, copying, installing or using the software you agree to this license.
//  If you do not agree to this license, do not download, install,
//  copy or use the software.
//
//
//                        Intel License Agreement
//                For Open Source Computer Vision Library
//
// Copyright (C) 2000, Intel Corporation, all rights reserved.
// Third party copyrights are property of their respective owners.
//
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//
//   * Redistribution's of source code must retain the above copyright notice,
//     this list of conditions and the following disclaimer.
//
//   * Redistribution's in binary form must reproduce the above copyright notice,
//     this list of conditions and the following disclaimer in the documentation
//     and/or other materials provided with the distribution.
//
//   * The name of Intel Corporation may not be used to endorse or promote products
//     derived from this software without specific prior written permission.
//
// This software is provided by the copyright holders and contributors "as is" and
// any express or implied warranties, including, but not limited to, the implied
// warranties of merchantability and fitness for a particular purpose are disclaimed.
// In no event shall the Intel Corporation or contributors be liable for any direct,
// indirect, incidental, special, exemplary, or consequential damages
// (including, but not limited to, procurement of substitute goods or services;
// loss of use, data, or profits; or business interruption) however caused
// and on any theory of liability, whether in contract, strict liability,
// or tort (including negligence or otherwise) arising in any way out of
// the use of this software, even if advised of the possibility of such damage.
//
//M*/

#include "cvtest.h"

/* ///////////////////// pyrlk_test ///////////////////////// */

class CV_OptFlowPyrLKTest : public CvTest
{
public:
    CV_OptFlowPyrLKTest();
protected:
    void run(int);
};


CV_OptFlowPyrLKTest::CV_OptFlowPyrLKTest():
    CvTest( "optflow-pyrlk", "cvCalcOpticalFlowPyrLK" )
{
    support_testing_modes = CvTS::CORRECTNESS_CHECK_MODE;
}

void CV_OptFlowPyrLKTest::run( int )
{
    int code = CvTS::OK;

    const double success_error_level = 0.2;
    const int bad_points_max = 2;

    /* test parameters */
    double  max_err = 0., sum_err = 0;
    int     pt_cmpd = 0;
    int     pt_exceed = 0;
    int     merr_i = 0, merr_j = 0, merr_k = 0;
    char    filename[1000];

    CvPoint2D32f *u = 0, *v = 0, *v2 = 0;
    CvMat *_u = 0, *_v = 0, *_v2 = 0;
    char* status = 0;

    IplImage* imgI = 0;
    IplImage* imgJ = 0;

    int  n = 0, i = 0;

    sprintf( filename, "%soptflow/%s", ts->get_data_path(), "lk_prev.dat" );
    _u = (CvMat*)cvLoad( filename );

    if( !_u )
    {
        ts->printf( CvTS::LOG, "could not read %s\n", filename );
        code = CvTS::FAIL_MISSING_TEST_DATA;
        goto _exit_;
    }

    sprintf( filename, "%soptflow/%s", ts->get_data_path(), "lk_next.dat" );
    _v = (CvMat*)cvLoad( filename );

    if( !_v )
    {
        ts->printf( CvTS::LOG, "could not read %s\n", filename );
        code = CvTS::FAIL_MISSING_TEST_DATA;
        goto _exit_;
    }

    if( _u->cols != 2 || CV_MAT_TYPE(_u->type) != CV_32F ||
        _v->cols != 2 || CV_MAT_TYPE(_v->type) != CV_32F || _v->rows != _u->rows )
    {
        ts->printf( CvTS::LOG, "the loaded matrices of points are not valid\n" );
        code = CvTS::FAIL_MISSING_TEST_DATA;
        goto _exit_;

    }

    u = (CvPoint2D32f*)_u->data.fl;
    v = (CvPoint2D32f*)_v->data.fl;

    /* allocate adidtional buffers */
    _v2 = cvCloneMat( _u );
    v2 = (CvPoint2D32f*)_v2->data.fl;

    /* read first image */
    sprintf( filename, "%soptflow/%s", ts->get_data_path(), "rock_1.bmp" );
    imgI = cvLoadImage( filename, -1 );

    if( !imgI )
    {
        ts->printf( CvTS::LOG, "could not read %s\n", filename );
        code = CvTS::FAIL_MISSING_TEST_DATA;
        goto _exit_;
    }

    /* read second image */
    sprintf( filename, "%soptflow/%s", ts->get_data_path(), "rock_2.bmp" );
    imgJ = cvLoadImage( filename, -1 );

    if( !imgJ )
    {
        ts->printf( CvTS::LOG, "could not read %s\n", filename );
        code = CvTS::FAIL_MISSING_TEST_DATA;
        goto _exit_;
    }
    
    n = _u->rows;
    status = (char*)cvAlloc(n*sizeof(status[0]));

    /* calculate flow */
    cvCalcOpticalFlowPyrLK( imgI, imgJ, 0, 0, u, v2, n, cvSize( 20, 20 ),
                            4, status, 0, cvTermCriteria( CV_TERMCRIT_ITER|
                            CV_TERMCRIT_EPS, 30, 0.01f ), 0 );

    /* compare results */
    for( i = 0; i < n; i++ )
    {
        if( status[i] != 0 )
        {
            double err;
            if( cvIsNaN(v[i].x) )
            {
                merr_j++;
                continue;
            }

            err = fabs(v2[i].x - v[i].x) + fabs(v2[i].y - v[i].y);
            if( err > max_err )
            {
                max_err = err;
                merr_i = i;
            }

            pt_exceed += err > success_error_level;
            if( pt_exceed > bad_points_max )
            {
                ts->printf( CvTS::LOG,
                    "The number of poorly tracked points is too big (>=%d)\n", pt_exceed );
                code = CvTS::FAIL_BAD_ACCURACY;
                goto _exit_;
            }

            sum_err += err;
            pt_cmpd++;
        }
        else
        {
            if( !cvIsNaN( v[i].x ))
            {
                merr_i = i;
                merr_k++;
                ts->printf( CvTS::LOG, "The algorithm lost the point #%d\n", i );
                code = CvTS::FAIL_BAD_ACCURACY;
                goto _exit_;
            }
        }
    }

    if( max_err > 1 )
    {
        ts->printf( CvTS::LOG, "Maximum tracking error is too big (=%g)\n", max_err );
        code = CvTS::FAIL_BAD_ACCURACY;
        goto _exit_;
    }

_exit_:

    cvFree( &status );
    cvReleaseMat( &_u );
    cvReleaseMat( &_v );
    cvReleaseMat( &_v2 );
    
    cvReleaseImage( &imgI );
    cvReleaseImage( &imgJ );

    if( code < 0 )
        ts->set_failed_test_info( code );
}

CV_OptFlowPyrLKTest optflow_pyr_lk_test;

/* End of file. */
