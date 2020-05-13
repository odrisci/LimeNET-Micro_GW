-- ----------------------------------------------------------------------------	
-- FILE: 	trigger.vhd
-- DESCRIPTION:	EXPERIMENTAL! Trigger rx/tx on GNSS TPULSE
-- DATE:	March 17, 2017
-- AUTHOR(s):	Lime Microsystems
-- REVISIONS:
-- ----------------------------------------------------------------------------	

-- ----------------------------------------------------------------------------
--NOTES:
-- ----------------------------------------------------------------------------
-- altera vhdl_input_version vhdl_2008
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fpgacfg_pkg.all;

-- ----------------------------------------------------------------------------
-- Entity declaration
-- ----------------------------------------------------------------------------
entity lms7_trx_trigger is
    port(
        clk         : in std_logic;
        reset_n     : in std_logic;
        fpgacfg_in  : in  t_FROM_FPGACFG;
        fpgacfg_out : out t_FROM_FPGACFG;
        trigger     : in  std_logic
        );
end lms7_trx_trigger;

-- ----------------------------------------------------------------------------
-- Architecture
-- ----------------------------------------------------------------------------
architecture arch of lms7_trx_trigger is
--declare signals,  components here
    signal trigger_out : std_logic;
begin


    process(clk, reset_n)
    begin
        if reset_n = '0' then
            trigger_out <= '0';
        elsif( clk'event and clk ='1' ) then
            --if((not fpgacfg_in.mode) or trigger ) and ( fpgacfg_in.rx_en ) then
            if(trigger and ( fpgacfg_in.rx_en ) ) then
                trigger_out <= '1';
            elsif(not fpgacfg_in.rx_en) then
                trigger_out <= '0';
            else
                trigger_out <= trigger_out;
            end if;
        end if;
    end process;

    --fpgacfg_out <= fpgacfg_in;
    fpgacfg_out.rx_en <= trigger_out;

    -- Assign others manually - is there a better way to do this????
    fpgacfg_out.phase_reg_sel     <= fpgacfg_in.phase_reg_sel;  
    fpgacfg_out.clk_ind           <= fpgacfg_in.clk_ind;
    fpgacfg_out.cnt_ind           <= fpgacfg_in.cnt_ind;
    fpgacfg_out.load_phase_reg    <= fpgacfg_in.load_phase_reg;
    fpgacfg_out.drct_clk_en       <= fpgacfg_in.drct_clk_en;
    fpgacfg_out.ch_en             <= fpgacfg_in.ch_en;
    fpgacfg_out.smpl_width        <= fpgacfg_in.smpl_width;
    fpgacfg_out.mode              <= fpgacfg_in.mode;
    fpgacfg_out.ddr_en            <= fpgacfg_in.ddr_en;
    fpgacfg_out.trxiq_pulse       <= fpgacfg_in.trxiq_pulse;
    fpgacfg_out.mimo_int_en       <= fpgacfg_in.mimo_int_en;
    fpgacfg_out.synch_dis         <= fpgacfg_in.synch_dis;
    fpgacfg_out.synch_mode        <= fpgacfg_in.synch_mode;
    fpgacfg_out.smpl_nr_clr       <= fpgacfg_in.smpl_nr_clr;
    fpgacfg_out.txpct_loss_clr    <= fpgacfg_in.txpct_loss_clr;
    -- fpgacfg_out.rx_en          <= fpgacfg_in.rx_en;
    fpgacfg_out.tx_en             <= fpgacfg_in.tx_en;
    fpgacfg_out.rx_ptrn_en        <= fpgacfg_in.rx_ptrn_en;
    fpgacfg_out.tx_ptrn_en        <= fpgacfg_in.tx_ptrn_en;
    fpgacfg_out.tx_cnt_en         <= fpgacfg_in.tx_cnt_en;
    fpgacfg_out.wfm_ch_en         <= fpgacfg_in.wfm_ch_en;
    fpgacfg_out.wfm_play          <= fpgacfg_in.wfm_play;
    fpgacfg_out.wfm_load          <= fpgacfg_in.wfm_load;
    fpgacfg_out.wfm_smpl_width    <= fpgacfg_in.wfm_smpl_width;
    fpgacfg_out.SPI_SS            <= fpgacfg_in.SPI_SS;
    fpgacfg_out.LMS1_SS           <= fpgacfg_in.LMS1_SS;
    fpgacfg_out.LMS1_RESET        <= fpgacfg_in.LMS1_RESET;
    fpgacfg_out.LMS1_CORE_LDO_EN  <= fpgacfg_in.LMS1_CORE_LDO_EN;
    fpgacfg_out.LMS1_TXNRX1       <= fpgacfg_in.LMS1_TXNRX1;
    fpgacfg_out.LMS1_TXNRX2       <= fpgacfg_in.LMS1_TXNRX2;
    fpgacfg_out.LMS1_TXEN         <= fpgacfg_in.LMS1_TXEN;
    fpgacfg_out.LMS1_RXEN         <= fpgacfg_in.LMS1_RXEN;
    fpgacfg_out.GPIO              <= fpgacfg_in.GPIO;
    fpgacfg_out.FPGA_LED1_CTRL    <= fpgacfg_in.FPGA_LED1_CTRL;
    fpgacfg_out.FPGA_LED2_CTRL    <= fpgacfg_in.FPGA_LED2_CTRL;
    fpgacfg_out.FPGA_LED3_CTRL    <= fpgacfg_in.FPGA_LED3_CTRL;
    fpgacfg_out.FPGA_LED4_CTRL    <= fpgacfg_in.FPGA_LED4_CTRL;
    fpgacfg_out.FPGA_LED5_CTRL    <= fpgacfg_in.FPGA_LED5_CTRL;
    fpgacfg_out.CLK_ENA           <= fpgacfg_in.CLK_ENA;
    fpgacfg_out.sync_pulse_period <= fpgacfg_in.sync_pulse_period;
    fpgacfg_out.sync_size         <= fpgacfg_in.sync_size;
    fpgacfg_out.txant_pre         <= fpgacfg_in.txant_pre;
    fpgacfg_out.txant_post        <= fpgacfg_in.txant_post;
end arch;
