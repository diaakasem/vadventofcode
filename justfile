default:
    @just --list

test:
    v test .

sample year day part:
    v run ./{{year}}/day-{{day}}/main_part{{part}}.v ./{{year}}/day-{{day}}/sample_input_part{{part}}.txt

run year day part:
    v run ./{{year}}/day-{{day}}/main_part{{part}}.v ./{{year}}/day-{{day}}/input.txt
