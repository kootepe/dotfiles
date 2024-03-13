# Default Theme
# If changes made here does not take effect, then try to re-create the tmux session to force reload.
BLACK="#0C0E15",
BG0="#1A212E",
BG1="#21283B",
BG2="#283347",
BG3="#2A324A",
BG_D="#141B24",
BG_BLUE="#54B0FD",
BG_YELLOW="#F2CC81",
FG="#93A4C3",
PURPLE="#C75AE8",
GREEN="#8BCD5B",
ORANGE="#DD9046",
BLUE="#41A7FC",
YELLOW="#EFBD5D",
CYAN="#34BFD0",
RED="#F65866",
GREY="#455574",
LIGHT_GREY="#6C7D9C",
DARK_CYAN="#1B6A73",
DARK_RED="#992525",
DARK_YELLOW="#8F610D",
DARK_PURPLE="#862AA1",
DIFF_ADD="#27341C",
DIFF_DELETE="#331C1E",
DIFF_CHANGE="#102B40",
DIFF_TEXT="#1C4A6E",
bg_color=$(__normalize_color "$TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR")
fg_color=$(__normalize_color "$TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR")

if patched_font_in_use; then
	TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
	TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""
else
	TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="◀"
	TMUX_POWERLINE_SEPARATOR_LEFT_THIN="❮"
	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="▶"
	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="❯"
fi

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-'235'}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-'255'}
TMUX_POWERLINE_SEG_AIR_COLOR=$("${TMUX_POWERLINE_DIR_HOME}/segments/air_color.sh")

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}

# See man tmux.conf for additional formatting options for the status line.
# The `format regular` and `format inverse` functions are provided as conveniences
# echo "fg=$bg_color,bg=$fg_color,nobold,noitalics,nounderscore"
# "#[fg=$BG3,bg=$FG,nobold,noitalics,nounderscore]"

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_CURRENT ]; then
	TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
		"#[$(format inverse)]"
		"$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
		" #I#F "
		"$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN"
		" #W "
		"#[$(format regular)]"
		"$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
	)
fi

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_STYLE ]; then
	TMUX_POWERLINE_WINDOW_STATUS_STYLE=(
		"$(format regular)"
	)
fi

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_FORMAT ]; then
	TMUX_POWERLINE_WINDOW_STATUS_FORMAT=(
		"#[$(format regular)]"
		"  #I#{?window_flags,#F, } "
		"$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN"
		" #W "
	)
fi

# Format: segment_name background_color foreground_color [non_default_separator] [separator_background_color] [separator_foreground_color] [spacing_disable] [separator_disable]
#
# * background_color and foreground_color. Formats:
#   * Named colors (chech man page of tmux for complete list) e.g. black, red, green, yellow, blue, magenta, cyan, white
#   * a hexadecimal RGB string e.g. #ffffff
#   * 'default' for the defalt tmux color.
# * non_default_separator - specify an alternative character for this segment's separator
# * separator_background_color - specify a unique background color for the separator
# * separator_foreground_color - specify a unique foreground color for the separator
# * spacing_disable - remove space on left, right or both sides of the segment:
#   * "left_disable" - disable space on the left
#   * "right_disable" - disable space on the right
#   * "both_disable" - disable spaces on both sides
#   * - any other character/string produces no change to default behavior (eg "none", "X", etc.)
#
# * separator_disable - disables drawing a separator on this segment, very useful for segments
#   with dynamic background colours (eg tmux_mem_cpu_load):
#   * "separator_disable" - disables the separator
#   * - any other character/string produces no change to default behavior
#
# Example segment with separator disabled and right space character disabled:
# "hostname 33 0 {TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD} 33 0 right_disable separator_disable"
#
# Note that although redundant the non_default_separator, separator_background_color and
# separator_foreground_color options must still be specified so that appropriate index
# of options to support the spacing_disable and separator_disable features can be used

if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
	TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
		"tmux_session_info $GREEN 234"
		# "hostname $BG3 $FG ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}"
		"hostname $BG3 $FG"
		#"ifstat 30 255" \
		#"ifstat_sys 30 255" \
		# "lan_ip $BG3 $FG ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}"
		# "wan_ip $BG3 $FG"
		# "vcs_branch $BG0 $BLACK"
		#"vcs_compare 60 255" \
		#"vcs_staged 64 255" \
		#"vcs_modified 9 255" \
		#"vcs_others 245 0" \
	)
fi

if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
	TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
		#"earthquake 3 0" \
		"pwd $BG3 $FG"
		#"macos_notification_count 29 255" \
		#"mailcount 9 255" \
		# "now_playing 234 37" \
		#"cpu 240 136" \
		# "load 237 167" \
		#"tmux_mem_cpu_load 234 136" \
		"battery $BG3 $FG ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}"
		#"air ${TMUX_POWERLINE_SEG_AIR_COLOR} 255" \
		# "weather 37 255" \
		#"rainbarf 0 ${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR}" \
		#"xkb_layout 125 117" \
		"date_day $GREEN $BLACK"
		"date $GREEN  $BLACK ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}"
		"time $GREEN  $BLACK ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}"
		#"utc_time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
	)
fi
