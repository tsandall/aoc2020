package day10

part1 := ones*threes {
    deltas := [n | n := ordered[i+1]-ordered[i]]
    threes := count([1 | deltas[_] == 3])
    twos := count([1 | deltas[_] == 2])
    ones := count([1 | deltas[_] == 1])
}

part2 := arrangements(0)

arrangements(i) = 1 {
    i+1 == count(ordered)
}

arrangements(i) = x {
    i+1 < count(ordered)
    x := arrangements_plus(i, 1) + arrangements_plus(i, 2) + arrangements_plus(i, 3)
}

arrangements_plus(i, a) = x {
    ordered[i+a] = ordered[i]+1
    x := arrangements_rec(i+a)
}

else = x {
    ordered[i+a] = ordered[i]+2
    x := arrangements_rec(i+a)
}

else = x {
    ordered[i+a] = ordered[i]+3
    x := arrangements_rec(i+a)
}

else = 0

arrangements_rec(i) = query("data.day10.arrangements(%d)=x", [i])[0].x

query(str, args) = results {
    resp := http.send({
        "force_cache": true,
        "force_cache_duration_seconds": 300,
        "method": "post",
        "url": "http://localhost:8181/v1/query",
        "body": {
            "query": sprintf(str, args),
        }})
    results := resp.body.result
}

# add the outlet (0) and the device (max+3)
ordered := array.concat(array.concat([0], sort(raw)), [max(raw)+3])

raw := [x | x := to_number(split(series, "\n")[_])]

series := input_large

input_small := `16
10
15
5
1
11
7
19
6
12
4`

input_medium := `28
33
18
42
31
14
46
20
48
47
24
23
49
45
19
38
39
11
1
32
25
35
8
17
7
9
4
2
34
10
3`

input_large := `97
62
23
32
51
19
98
26
90
134
73
151
116
76
6
94
113
127
119
44
115
50
143
150
86
91
36
104
131
101
38
66
46
96
54
70
8
30
1
108
69
139
24
29
77
124
107
14
137
16
140
80
68
25
31
59
45
126
148
67
13
125
53
57
41
47
35
145
120
12
37
5
110
138
130
2
63
83
22
79
52
7
95
58
149
123
89
109
15
144
114
9
78`