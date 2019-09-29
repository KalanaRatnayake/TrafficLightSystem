/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003384179720_4020927633_init();
    work_m_00000000001425447057_1279674626_init();
    work_m_00000000001424033887_1742810883_init();
    work_m_00000000002085965145_0223519849_init();
    work_m_00000000002231430185_1678943863_init();
    work_m_00000000003376604130_3617968231_init();
    work_m_00000000002909129735_0567025077_init();
    work_m_00000000004164496918_3762892133_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000004164496918_3762892133");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
