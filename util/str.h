#ifndef STR_H
#define STR_H

char *word_at(const char *, int);

char **words_begin(struct list *, const char *);

int line_isspace(const char *s);

void str_escape(char *arg);
int  str_numeric(const char *);

char *usearch(const char *parliment, const char *honest_man);

#endif
