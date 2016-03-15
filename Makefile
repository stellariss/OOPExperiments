EXPERIMENTS := $(shell ls -d ex*)

.PHONY: all
all:
	for ex in $(EXPERIMENTS); \
	do \
		pushd $$ex; \
		make all; \
		popd; \
	done

.PHONY: clean
clean:
	for ex in $(EXPERIMENTS); \
	do \
		pushd $$ex; \
		make clean; \
		popd; \
	done

.PHONY: test
test: all
	for ex in $(EXPERIMENTS); \
	do \
		pushd $$ex; \
		echo ==========$$ex==========; \
		echo '```' > OUTPUT.md; \
		./main | tee -a OUTPUT.md; \
		echo '```' >> OUTPUT.md; \
		echo =======================; \
		popd; \
	done
