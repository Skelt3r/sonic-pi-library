define :kick do
  loop do
    sample :drum_heavy_kick
    sleep 2
    sample :drum_heavy_kick
    sleep 2
    sample :drum_heavy_kick
    sleep 2
    sample :drum_heavy_kick
    sleep 0.75
    sample :drum_heavy_kick
    sleep 0.75
    sample :drum_heavy_kick
    sleep 0.5
  end
end

define :snare do
  with_fx :reverb, room: 0.8 do
    loop do
      sleep 1
      sample :drum_snare_hard, amp: 0.75
      sleep 1
    end
  end
end

define :hi_hat do
  loop do
    sample :drum_cymbal_closed, amp: 0.9
    sleep 0.25
    sample :drum_cymbal_closed, amp: 0.1
    sleep 0.25
  end
end

define :crash do
  loop do
    sample :drum_splash_hard, amp: 0.2, rate: 0.75
    sleep 8
  end
end

define :rev_crash do
  loop do
    sample :drum_splash_soft, amp: 0.35, rate: -0.4
    sleep 8
  end
end

define :bassline do
  with_fx :slicer, phase: 0.25, pulse_width: 0.75 do
    with_fx :distortion, amp: 0.9 do
      use_synth :fm
      # intro
      8.times do
        play 40, release: 0.5
        sleep 0.5
      end
      4.times do
        play 42, release: 0.5
        sleep 0.5
      end
      4.times do
        play 45, release: 0.5
        sleep 0.5
      end
      loop do
        # first lick
        4.times do
          8.times do
            play 40, release: 0.5
            sleep 0.5
          end
          4.times do
            play 42, release: 0.5
            sleep 0.5
          end
          4.times do
            play 45, release: 0.5
            sleep 0.5
          end
        end
        # second lick
        4.times do
          4.times do
            play 40, release: 0.3
            sleep 0.25
          end
          sleep 0.5
          4.times do
            play 40, release: 0.3
            sleep 0.25
          end
          sleep 0.5
          4.times do
            play 40, release: 0.3
            sleep 0.25
          end
          4.times do
            play 42, release: 0.3
            sleep 0.25
          end
          sleep 0.5
          4.times do
            play 42, release: 0.3
            sleep 0.25
          end
          sleep 0.5
          4.times do
            play 45, release: 0.3
            sleep 0.25
          end
        end
      end
    end
  end
end

define :piano do
  use_synth :piano
  with_fx :reverb, mix: 0.6 do
    loop do
      1.times do
        42.times do
          play 64, amp: 0.5
          sleep 0.25
          play 66, amp: 0.5
          sleep 0.25
          play 69, amp: 0.5
          sleep 0.25
        end
        play 66, amp: 0.5
        sleep 0.25
        play 64, amp: 0.5
        # break
        sleep 32.25
      end
    end
  end
end

define :synth_drone do
  use_synth :hoover
  with_fx :flanger, wave: 4, invert_flange: 1 do
    with_fx :reverb, mix: 0.5 do
      loop do
        play 52, amp: 0.25, release: 8
        sleep 4
        play 54, amp: 0.25, release: 4
        sleep 2
        play 57, amp: 0.25, release: 4
        sleep 2
      end
    end
  end
end

define :synth_harmony do
  use_synth :blade
  with_fx :reverb, mix: 0.8 do
    sleep 16
    loop do
      sleep 16
      2.times do
        play 67, amp: 1, attack: 0.2, release: 8
        sleep 4
        play 69, amp: 1, attack: 0.2, release: 4
        sleep 2
        play 74, amp: 1, attack: 0.2, release: 4
        sleep 2
        play 67, amp: 1, attack: 0.2, release: 8
        sleep 4
        play 64, amp: 1, attack: 0.2, release: 4
        sleep 2
        play 57, amp: 1, attack: 0.15, release: 2
        sleep 1
        play 59, amp: 1, attack: 0.15, release: 2
        sleep 1
      end
      sleep 16
    end
  end
end

define :synth_lead do
  use_synth :chiplead
  loop do
    play 69, amp: 0.25
    sleep 0.25
    play 66, amp: 0.25
    sleep 0.25
    play 62, amp: 0.25
    sleep 0.5
    play 64, amp: 0.25
    sleep 0.25
    play 66, amp: 0.25
    sleep 0.5
    play 69, amp: 0.25
    sleep 0.5
    play 66, amp: 0.25
    sleep 0.5
    play 62, amp: 0.25
    sleep 0.25
    play 69, amp: 0.25
    sleep 0.25
    play 66, amp: 0.25
    sleep 0.25
    play 62, amp: 0.25
    sleep 0.5
    play 69, amp: 0.25
    sleep 0.25
    play 66, amp: 0.25
    sleep 0.25
    play 62, amp: 0.25
    sleep 0.5
    play 64, amp: 0.25
    sleep 0.25
    play 66, amp: 0.25
    sleep 0.5
    play 69, amp: 0.25
    sleep 0.5
    play 66, amp: 0.25
    sleep 0.5
    play 62, amp: 0.25
    sleep 0.25
    play 69, amp: 0.25
    sleep 0.25
    play 66, amp: 0.25
    sleep 0.25
    play 62, amp: 0.25
    sleep 0.25
    play 64, amp: 0.25
    sleep 0.25
  end
end

define :main do
  in_thread do kick end
  in_thread do snare end
  in_thread do hi_hat end
  in_thread do bassline end
  
  sleep 4
  
  in_thread do rev_crash end
  
  sleep 4
  
  in_thread do crash end
  in_thread do piano end
  in_thread do synth_drone end
  in_thread do synth_lead end
  in_thread do synth_harmony end
end

main
